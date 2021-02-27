defmodule GetpayWeb.UsersController do
  use GetpayWeb, :controller

  alias Getpay.User

  action_fallback GetpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Getpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
