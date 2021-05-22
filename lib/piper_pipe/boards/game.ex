defmodule PiperPipe.Boards.Game do
  use Ecto.Schema

  schema "boards_games" do
    field :name

    timestamps()
  end
end
