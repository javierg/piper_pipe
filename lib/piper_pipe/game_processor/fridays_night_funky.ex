defmodule PiperPipe.GameProcessor.FridaysNightFunky do
  import Ecto.Query
  import PiperPipe.GameProcessor.Common

  alias PiperPipe.Boards.Game
  alias PiperPipe.Repo
  alias FridaysNightFunky.Service

  def perform(%{"user_id" => user_id,
                "score" => score}) do

     game_user = Service.get(user_id)
     game      = fetch_game()

     find_or_create_user(game_user.username, game_user)
     |> insert_game(game, score)
  end

  defp fetch_game do
    Repo.one(from g in Game, where: g.name == "Fridays Night Funky")
  end
end
