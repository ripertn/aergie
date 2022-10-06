defmodule Aergie.Wallet.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :isin, :string
    field :name, :string
    field :pru, :float
    field :quantity, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:type, :name, :isin, :quantity, :pru])
    |> validate_required([:type, :name, :isin, :quantity, :pru])
  end
end
