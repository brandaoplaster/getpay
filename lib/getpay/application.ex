defmodule Getpay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Getpay.Repo,
      # Start the Telemetry supervisor
      GetpayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Getpay.PubSub},
      # Start the Endpoint (http/https)
      GetpayWeb.Endpoint
      # Start a worker by calling: Getpay.Worker.start_link(arg)
      # {Getpay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Getpay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GetpayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
