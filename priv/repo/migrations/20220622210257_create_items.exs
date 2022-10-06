defmodule Aergie.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :type, :string
      add :name, :string
      add :isin, :string
      add :quantity, :integer
      add :pru, :float

      timestamps()
    end
  end
end
