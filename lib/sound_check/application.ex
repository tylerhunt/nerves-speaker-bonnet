defmodule SoundCheck.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias SoundCheck.Audio

  def start(_type, _args) do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SoundCheck.Supervisor]

    children =
      [
        # Children for all targets
        # Starts a worker by calling: SoundCheck.Worker.start_link(arg)
        # {SoundCheck.Worker, arg},
      ] ++ children(target())

    Supervisor.start_link(children, opts)
  end

  # List all child processes to be supervised
  def children(:host) do
    [
      # Children that only run on the host
      # Starts a worker by calling: SoundCheck.Worker.start_link(arg)
      # {SoundCheck.Worker, arg},
    ]
  end

  def children(:rpi0) do
    [
      {Audio, name: Audio},
      {Task, fn -> Audio.play() end}
    ]
  end

  def target() do
    Application.get_env(:sound_check, :target)
  end
end
