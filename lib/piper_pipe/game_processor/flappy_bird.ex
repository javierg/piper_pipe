defmodule PiperPipe.GameProcessor.FlappyBird do
  import Ecto.Query
  import PiperPipe.GameProcessor.Common

  alias PiperPipe.Boards.Game

  def perform(%{"user_id" => user_id,
                "score" => score}) do

     game_user = FlappyBird.Service.get(user_id)
     game      = fetch_game()

     find_or_create_user(game_user.username, game_user)
     |> insert_game(game, score)
  end

  defp fetch_game do
    PiperPipe.Repo.one(from g in Game, where: g.name == "Flappy Bird")
  end
end
