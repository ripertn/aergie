defmodule Aergie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  use Commanded.Application, otp_app: :aergie

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Aergie.Repo,
      # Start the Telemetry supervisor
      AergieWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Aergie.PubSub},
      # Start the Endpoint (http/https)
      AergieWeb.Endpoint,
      # Start a worker by calling: Aergie.Worker.start_link(arg)
      # {Aergie.Worker, arg}
      Puller
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Aergie.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AergieWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
