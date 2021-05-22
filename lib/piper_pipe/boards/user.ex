defmodule PiperPipe.Boards.User do
  use Ecto.Schema

  schema "boards_users" do
    field :username
    field :first_name
    field :last_name
    field :email

    timestamps()
  end
end
