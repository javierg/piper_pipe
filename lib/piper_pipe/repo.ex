defmodule PiperPipe.Repo do
  use Ecto.Repo,
    otp_app: :piper_pipe,
    adapter: Ecto.Adapters.Postgres
end
