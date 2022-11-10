defmodule Puller do
  use GenServer
  require Logger

  @moduledoc """
    Puller module is intended to pull data from API, such as alphaVantage, in order to get an up to date price of shares
  """

  def start_link(opts), do: GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  def init(_opts) do
    wallet = case Aergie.Repo.all(Aergie.Wallet.Item) do
      res when is_list(res) -> res
      _other -> Logger.warn("No shares found in wallet ...") && []
    end

    # set next automatic pull
    case Time.to_seconds_after_midnight(Time.utc_now) do
      {x,_} when x < 28800-> Process.send_after(self(), :pull, x*1000)                    #before 8:00 am
      {x,_} -> Process.send_after(self(), :pull, (x+28800)*1000)                          #after 8:00 am
    end

    {:ok, wallet}
  end

  def handle_info(:pull, _s) do
    wallet = case Aergie.Repo.all(Aergie.Wallet.Item) do
      res when is_list(res) -> res
      _other -> Logger.warn("No shares found in wallet ...") && []
    end

    send(self(), {:pull, wallet})
    {:noreply, wallet}
  end

  def handle_info({:pull, [h|t]}, s) do
    
    Logger.info("start pulling data for #{to_string(h.mnemo)}")
    {:ok, res} = AlphaVantage.getLastValue(h.mnemo)
    Aergie.Wallet.update_item(h, %{last_price: res.last_price, open_price: res.open_price, highest_price: res.highest_price, lowest_price: res.lowest_price })
    Logger.info("data pulled for #{to_string(h.mnemo)}")

    Process.send_after(__MODULE__, {:pull, t}, 15_000)  # no more than 5 calls per minute with AlphaVantage free API
    
    {:noreply, s}
  end

  def handle_info({:pull, []}, s) do

    Logger.info("End data pull with success")

    # set next automatic pull
    case Time.to_seconds_after_midnight(Time.utc_now) do
      {x,_} when x < 28800-> Process.send_after(self(), :pull, x*1000)                     #before 8:00 am
      {x,_} -> Process.send_after(self(), :pull, (x+28800)*1000)                           #after 8:00 am
    end

    {:noreply, s}
  end

  def get_state(), do: GenServer.call(__MODULE__, :get_state)
  def handle_call(:get_state, _from, state), do: {:reply, state, state}

end