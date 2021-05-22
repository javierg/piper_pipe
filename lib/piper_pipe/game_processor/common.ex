defmodule PiperPipe.GameProcessor.Common do
  import Ecto.Query

  alias PiperPipe.Repo
  alias PiperPipe.Boards.User
  alias PiperPipe.Boards.Leader

  def find_or_create_user(user_identifier, game_user) do
    Repo.one(from u in User,
      where: u.username == ^user_identifier)
    |> ensure_user(game_user)
  end

  def insert_game(user, game, score) do
    Repo.insert!(%Leader{user: user,
                         game: game,
                         score: score})
  end

  defp ensure_user(nil, game_user) do
    Repo.insert!(%User{email: game_user.email,
                       first_name: game_user.first_name,
                       last_name: game_user.last_name,
                       username: game_user.username})
  end

  defp ensure_user(user, _), do: user
end
