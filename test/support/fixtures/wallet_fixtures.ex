defmodule Aergie.WalletFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aergie.Wallet` context.
  """

  @doc """
  Generate a title.
  """
  def title_fixture(attrs \\ %{}) do
    {:ok, title} =
      attrs
      |> Enum.into(%{
        isin: "some isin",
        name: "some name",
        pru: 120.5,
        quantity: 42,
        type: "some type"
      })
      |> Aergie.Wallet.create_title()

    title
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        isin: "some isin",
        name: "some name",
        pru: 120.5,
        quantity: 42,
        type: "some type"
      })
      |> Aergie.Wallet.create_item()

    item
  end
end
