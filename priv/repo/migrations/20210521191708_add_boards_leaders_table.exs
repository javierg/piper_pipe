defmodule PiperPipe.Repo.Migrations.AddBoardsLeadersTable do
  use Ecto.Migration

  def change do
    create table("boards_leaders") do
      add :score, :integer, null: false
      add :game_id, references(:boards_games), null: false
      add :user_id, references(:boards_users), null: false

      timestamps()
    end

    create index("boards_leaders", :game_id)
    create index("boards_leaders", :user_id)
  end
end
