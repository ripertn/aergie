defmodule AergieWeb.ItemLive.Index do
  use AergieWeb, :live_view

  alias Aergie.Wallet
  alias Aergie.Wallet.Item

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :items, list_items())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Item")
    |> assign(:item, Wallet.get_item!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Item")
    |> assign(:item, %Item{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Items")
    |> assign(:item, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    item = Wallet.get_item!(id)
    {:ok, _} = Wallet.delete_item(item)

    {:noreply, assign(socket, :items, list_items())}
  end

  defp list_items do
    Wallet.list_items()
  end
end
