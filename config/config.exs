import Config

config :piper_pipe,
  ecto_repos: [PiperPipe.Repo, AmongUs.Repo]

config :piper_pipe, PiperPipe.Repo,
  database: "piper_pipe_repo",
  username: "javierg",
  password: "",
  hostname: "localhost"

config :goth,
  json: System.get_env("GOOGLE_AUTH_FILE") |> File.read!()

config :piper_pipe, AmongUs.Repo,
  database: "among_us_users",
  username: "",
  password: "",
  hostname: "localhost",

config :piper_pipe, PiperPipe.Subscriber,
  project_id: "",
  subscription: "",
  producer_module: BroadwayCloudPubSub.Producer

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
