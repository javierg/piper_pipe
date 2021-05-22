defmodule AmongUs.User do
  use Ecto.Schema

  schema "users" do
    field :username
    field :first_name
    field :last_name
    field :email

    timestamps(inserted_at: :created_at)
  end
end
