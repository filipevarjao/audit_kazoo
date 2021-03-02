defmodule AuditKazoo.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      AuditKazoo.Server,
      {Plug.Cowboy, scheme: :http, plug: AuditKazoo.Router, options: [port: 4000]}
    ]

    Logger.info("Visit: http://localhost:4000")
    opts = [strategy: :one_for_one, name: AuditKazoo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
