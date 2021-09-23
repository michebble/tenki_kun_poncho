defmodule TenkiKun.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TenkiKun.Supervisor]

    children = children(target())

    Supervisor.start_link(children, opts)
  end

  # List all child processes to be supervised
  def children(:host) do
    [
      # Children that only run on the host
      # Starts a worker by calling: TenkiKun.Worker.start_link(arg)
      # {TenkiKun.Worker, arg},
    ]
  end

  def children(_target) do
    [
      {SGP30, []},
      {BMP280, [i2c_address: 0x77, name: BMP280]},
      {VEML6030, %{}}
    ]
  end

  def target() do
    Application.get_env(:tenki_kun, :target)
  end
end
