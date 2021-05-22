defmodule PiperPipe.Subscriber do
  use Broadway
  alias PiperPipe.Processor
  alias PiperPipe.Subscriber

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module: producer_opts()
      ],
      processors: [
        default: [concurrency: 2]
      ],
      batchers: [
        default: [batch_size: 10]
      ]
    )
  end

  @doc """
  This is the callback for a single message. The message received have this form

  %Broadway.Message{
    acknowledger: {BroadwayCloudPubSub.ClientAcknowledger,
     #Reference<0.3247436956.2116288513.216948>,
     %{
       ack_id: "base64 encoded ack id"
     }},
    batch_key: :default,
    batch_mode: :bulk,
    batcher: :default,
    data: ENCODED_DATA_JSON_STR,
    metadata: %{}
    status: :ok
  }

  The payload is a Map with the keys as:

  ```
    %{
      "version"   => 1,         # Integer
      "user_id"   => user_id,   # Integer
      "game_name" => game_name, # String
      "score"     => score      # Integer
    }
  ```
  """
  def handle_message(_processor_name, message, _context) do
    message
    |> Map.get(:data)
    |> decode_data
    |> Processor.process

    message
  end

  def handle_batch(:default, messages, _batch_info, _context) do
    messages
  end

  defp producer_opts do
    config = fetch_config()

    {
      config[:producer_module],
      subscription: project_subscription(config[:producer_module])
    }
  end

  defp project_subscription(Broadway.DummyProducer), do: []
  defp project_subscription(_) do
    config = fetch_config()
    "projects/#{config[:project_id]}/subscriptions/#{config[:subscription]}"
  end

  defp fetch_config, do: Application.get_env(:piper_pipe, Subscriber)
  defp decode_data(message), do: Jason.decode!(message)
end
