defmodule PiperPipe.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AmongUs.Repo,
      %{id: Exq, start: {Exq, :start_link, []}, type: :supervisor},
      PiperPipe.Subscriber,
      PiperPipe.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PiperPipe.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
