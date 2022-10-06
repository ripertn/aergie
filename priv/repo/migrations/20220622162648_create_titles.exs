defmodule Aergie.Repo.Migrations.CreateTitles do
  use Ecto.Migration

  def change do
    create table(:titles) do
      add :type, :string
      add :name, :string
      add :isin, :string
      add :quantity, :integer
      add :pru, :float

      timestamps()
    end
  end
end
