defmodule FridaysNightFunky.Service do
  def get(user_id) do
    mock_users()
    |> Map.get(user_id)
    |> set_username
  end

  defp set_username(user) do
    Map.merge(user, %{username: "user_#{user.id}"})
  end

  defp mock_users do
    %{
      1 => %{id: 1, email: "user1@user.com", first_name: "Bird", last_name: "One"},
      2 => %{id: 2, email: "user2@user.com", first_name: "Bird", last_name: "Two"},
      3 => %{id: 3, email: "user3@user.com", first_name: "Bird", last_name: "Three"},
      4 => %{id: 4, email: "user4@user.com", first_name: "Bird", last_name: "Four"},
      5 => %{id: 5, email: "user5@user.com", first_name: "Bird", last_name: "Five"},
    }
  end
end
