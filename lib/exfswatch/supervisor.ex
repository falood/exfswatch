defmodule ExFSWatch.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def start_child(args) do
    Supervisor.start_child(__MODULE__, [args])
  end

  def init([]) do
    [ worker(ExFSWatch.Worker, [], [restart: :transient])
    ] |> supervise(strategy: :simple_one_for_one)
  end
end
