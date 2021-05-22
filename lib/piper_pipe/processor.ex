defmodule PiperPipe.Processor do
  @default_queue "piper_pipe"

  @type pubsub_msg :: %{
    required(Integer.t) => Integer.t,
    required(Integer.t) => Integer.t,
    required(String.t)  => String.t,
    required(Integer.t) => Integer.t,
    required(Integer.t) => Integer.t,
  }

  @spec process(pubsub_msg) :: :ok
  def process(%{"version" => 1, "game_name" => game_name} = msg) do
    Exq.enqueue(Exq, @default_queue, game_processor(game_name), [msg])
  end

  defp game_processor(name) do
    game_module = Macro.camelize(name)
    :"Elixir.PiperPipe.GameProcessor.#{game_module}"
  end
end
