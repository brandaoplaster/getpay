defmodule GetpayWeb.Router do
  use GetpayWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GetpayWeb do
    pipe_through :api
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: GetpayWeb.Telemetry
    end
  end
end
