defmodule Hearkingston.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HearkingstonWeb.Telemetry,
      # Start the Ecto repository
      Hearkingston.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hearkingston.PubSub},
      # Start Finch
      {Finch, name: Hearkingston.Finch},
      # Start the Endpoint (http/https)
      HearkingstonWeb.Endpoint
      # Start a worker by calling: Hearkingston.Worker.start_link(arg)
      # {Hearkingston.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hearkingston.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HearkingstonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
