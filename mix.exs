defmodule PiperPipe.MixProject do
  use Mix.Project

  def project do
    [
      app: :piper_pipe,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {PiperPipe.Application, []},
      extra_applications: [
        :ecto,
        :exq,
        :inets,
        :logger,
        :myxql,
        :postgrex
      ]
    ]
  end

  defp deps do
    [
      {:broadway_cloud_pub_sub, "~> 0.6.0"},
      {:ecto_sql, "~> 3.0"},
      {:exq, "~> 0.14.0"},
      {:goth, "~> 1.0"},
      {:jason, "~> 1.1"},
      {:myxql, ">= 0.0.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
