defmodule Getpay.Repo do
  use Ecto.Repo,
    otp_app: :getpay,
    adapter: Ecto.Adapters.Postgres
end
