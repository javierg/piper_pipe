defmodule PiperPipe.Repo.Migrations.AddBoardsGameTable do
  use Ecto.Migration

  def change do
    create table("boards_games") do
      add :name, :string, null: false

      timestamps()
    end
  end
end
