defmodule AlphaVantage do
  @moduledoc """
    Alpha vantage Api helpers to get last price of values

    see https://www.alphavantage.co
  """

  @timeout [recv_timeout: 30_000, connect_timeout: 30_000]
  @api_key "FY4C9ED2UM6PLD1F"

  
  # def getValueRaw(mnemo \\ "GLE") do
  #   url = "https://www.quandl.com/api/v3/datasets/EURONEXT/#{mnemo}.json?api_key=#{@api_key}" |> IO.inspect
  #   case :httpc.request(:get, {'#{url}',[]}, @timeout, []) do
  #       {:ok,{{_,200,_},_head,body}} -> {:ok, Poison.decode!(body)}
  #       error -> {:error,error}
  #   end
  # end

  def getLastValue(mnemo \\ "GLE")
  # def getLastValue(mnemos) when is_list(mnemos), do: Enum.map(mnemos, fn mnemo -> getLastValue(mnemo) end)
  def getLastValue(mnemo) do
    startDate = "start_date=" <> (Date.utc_today |> Date.add(-5) |> Date.to_string)
    endDate = "end_date=" <> (Date.utc_today |> Date.to_string)
    url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{mnemo}.PA&apikey=#{@api_key}" |> IO.inspect()
    case :httpc.request(:get, {'#{url}',[]}, @timeout, []) do
      {:ok,{{_,200,_},_head,body}} ->
        IO.inspect(Poison.decode!(body))
        res = Poison.decode!(body)["Global Quote"]
      
        %{
          "02. open" => open_price,
          "03. high" => highest_price,
          "04. low" => lowest_price,
          "05. price" => last_price,
          "06. volume" => volume,
          "07. latest trading day" => date,
        } = res
            
        res = %{mnemo: mnemo, id: mnemo, date: date, open_price: open_price, highest_price: highest_price, lowest_price: lowest_price, last_price: last_price, volume: volume}
        {:ok, res}
      error -> {:error,error}
    end
  end
end