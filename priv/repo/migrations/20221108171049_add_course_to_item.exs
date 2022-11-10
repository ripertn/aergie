defmodule Aergie.Repo.Migrations.AddCourseToItem do
  use Ecto.Migration

  def change do
    alter table("items") do
      add :last_price, :float
      add :open_price, :float
      add :highest_price, :float
      add :lowest_price, :float
    end
  end
end
