# PiperPipe

This is a demo app for a GCP PubSub Data Pipeline with Broadway + Exq for parallel processing.

# Requirements

You will need a GCP account and setup a project with PubSub API enabled.
Also is required to have a topic created and a subscriber to which send messages and receive them.

This project will act as a subscriber, to config the pubsub use the `config/config.exs` file

```
config :piper_pipe, PiperPipe.Subscriber,
  project_id: "project name",
  subscription: "subscription name",
  producer_module: BroadwayCloudPubSub.Producer
```

We set a producer module, to be able to have different message sources, here you can switch to use
AWS SQS or Kafka, etc.

Also we need to setup EXQ for process the jobs in a queue locally and retry on failures:

```
config :exq,
  name: Exq,
  host: "localhost",
  namespace: nil,
  database: 0,
  port: 6379,
  concurrency: 100,
  queues: ["piper_pipe"],
  poll_timeout: 50,
  scheduler_poll_timeout: 200,
  scheduler_enable: true,
  max_retries: 25,
  mode: :default,
  shutdown_timeout: 5000,
  start_on_application: false
```

We dont start the Exq application right away, as we will added to the main app supervision tree

# Installation

To install just clone the repo and run `mix deps.get`. You can then try it with `iex -S mix`.

# TODO

Writte a better READ ME
