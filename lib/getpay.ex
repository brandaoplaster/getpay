defmodule Getpay do
  alias Getpay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
