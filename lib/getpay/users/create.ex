defmodule Getpay.Users.Create do
  alias Getpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
