defmodule PiperPipe.GameProcessor.AmongUs do
  import Ecto.Query
  import PiperPipe.GameProcessor.Common

  alias PiperPipe.Boards.Game
  alias PiperPipe.Repo

  def perform(%{"user_id" => user_id,
                "score" => score}) do

     game_user = AmongUs.Repo.get(AmongUs.User, user_id)
     game      = fetch_game()

     find_or_create_user(game_user.email, game_user)
     |> insert_game(game, score)
  end

  defp fetch_game do
     Repo.one(from g in Game, where: g.name == "Among Us")
  end
end
