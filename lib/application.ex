defmodule MyBot.Application do
  use Application

  @impl true
  @spec start(
          Application.start_type(),
          term()
        ) :: {:ok, pid()} | {:ok, pid(), Application.state()} | {:error, term()}
  def start(_type, _args) do
    children = [MyBot.ConsumerSupervisor]

    options = [strategy: :one_for_one, name: MyBot.Supervisor]
    Supervisor.start_link(children, options)
  end
end
