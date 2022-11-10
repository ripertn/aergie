defmodule Aergie.Repo.Migrations.AddMnemoToItem do
  use Ecto.Migration

  def change do
    alter table("items") do
      add :mnemo, :text
    end
  end
end
