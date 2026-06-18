defmodule EnvoyXds.MixProject do
  use Mix.Project

  def project do
    [
      app: :envoy_xds,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # grpc 1.0.0 split the umbrella into grpc_core (shared, provides
      # GRPC.Service used by the generated .Service stubs) and grpc (client,
      # provides GRPC.Stub used by the generated .Stub stubs). The server
      # implementation lives in grpc_server, pulled in by consumers
      # (e.g. ex_control_plane) rather than here.
      {:grpc, "~> 1.0"},
      {:protobuf, "~> 0.17"}
    ]
  end
end
