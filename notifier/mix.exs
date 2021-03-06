defmodule Notifier.MixProject do
  use Mix.Project

  def project do
    [
      app: :notifier,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto],
      mod: {Notifier.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:broadway, "~> 0.6.0"},
      {:csv, "~> 2.3.1"},
      {:gen_stage, "~> 1.0.0"},
      {:httpoison, "~> 1.6.2"},
      {:mongodb_driver, "~> 0.6"},
      {:plug_cowboy, "~> 2.1.2"},
      {:poison, "~> 4.0.1"},
      # dev deps
      {:credo, "~> 1.3", only: [:dev, :test], runtime: false}
    ]
  end
end
