defmodule AmongUs.Repo do
  use Ecto.Repo,
    otp_app: :piper_pipe,
    adapter: Elixir.Ecto.Adapters.MyXQL
end
