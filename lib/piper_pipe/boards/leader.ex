defmodule PiperPipe.Boards.Leader do
  use Ecto.Schema

  alias PiperPipe.Boards.User
  alias PiperPipe.Boards.Game

  schema "boards_leaders" do
    field :score, :integer

    belongs_to :game, Game
    belongs_to :user, User

    timestamps()
  end
end
