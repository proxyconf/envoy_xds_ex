defmodule Envoy.Watchdog.V3.AbortActionConfig do
  @moduledoc """
  A GuardDogAction that will terminate the process by killing the
  stuck thread. This would allow easier access to the call stack of the stuck
  thread since we would run signal handlers on that thread. By default
  this will be registered to run as the last watchdog action on KILL and
  MULTIKILL events if those are enabled.
  [#protodoc-title: Watchdog Action that kills a stuck thread to kill the process.]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :wait_duration, 1, type: Google.Protobuf.Duration, json_name: "waitDuration"
end
