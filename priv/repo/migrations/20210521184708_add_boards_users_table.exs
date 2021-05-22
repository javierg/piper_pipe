defmodule PiperPipe.Repo.Migrations.AddBoardsUsersTable do
  use Ecto.Migration

  def change do
    create table("boards_users") do
      add :username, :string, null: false
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :email, :string, null: false

      timestamps()
    end

    create index("boards_users", :username)
    create index("boards_users", :email)
  end
end
