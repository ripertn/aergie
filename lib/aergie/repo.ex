defmodule Aergie.Repo do
  use Ecto.Repo,
    otp_app: :aergie,
    adapter: Ecto.Adapters.Postgres
end
