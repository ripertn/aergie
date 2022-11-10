defmodule Aergie.Wallet.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :isin, :string
    field :name, :string
    field :pru, :float
    field :quantity, :integer
    field :type, :string
    field :mnemo, :string
    field :last_price, :float
    field :open_price, :float
    field :highest_price, :float
    field :lowest_price, :float

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:type, :name, :isin, :quantity, :pru, :mnemo, :last_price, :open_price, :highest_price, :lowest_price])
    |> validate_required([:type, :name, :isin, :quantity, :pru, :mnemo, :last_price, :open_price, :highest_price, :lowest_price])
  end
end
