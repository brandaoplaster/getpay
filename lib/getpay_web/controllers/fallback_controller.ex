defmodule GetpayWeb.FallbackController do
  use GetpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(GetpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
