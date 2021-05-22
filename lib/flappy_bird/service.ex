defmodule FlappyBird.Service do
  defstruct [:id, :username, :email, :first_name, :last_name]

  def get(user_id) do
    mock_users()
    |> Map.get(user_id)
    |> parse_user
  end

  defp parse_user({_, user}) do
    %__MODULE__{
      id: user.id,
      username: user.id,
      email: user.email,
      first_name: fetch_name_part(user, :first),
      last_name: fetch_name_part(user, :last)
    }
  end

  defp fetch_name_part(%{name: name}, part) do
    name
    |> String.split
    |> fetch_part(part)
  end

  defp fetch_part(name_list, :first), do: List.first(name_list)
  defp fetch_part(name_list, :last), do: List.last(name_list)

  defp mock_users do
    %{
      "bird1" => %{id: "bird1", email: "user1@user.com", name: "Bird One"},
      "bird2" => %{id: "bird2", email: "user2@user.com", name: "Bird Two"},
      "bird3" => %{id: "bird3", email: "user3@user.com", name: "Bird Three"},
      "bird4" => %{id: "bird4", email: "user4@user.com", name: "Bird Four"},
      "bird5" => %{id: "bird5", email: "user5@user.com", name: "Bird Five"},
    }
  end
end
