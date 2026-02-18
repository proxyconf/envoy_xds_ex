defmodule Envoy.Config.Retry.PreviousHosts.V2.PreviousHostsPredicate do
  @moduledoc """
  [#protodoc-title: Previous Hosts Predicate]
  [#extension: envoy.retry_host_predicates.previous_hosts]
  """

  use Protobuf,
    full_name: "envoy.config.retry.previous_hosts.v2.PreviousHostsPredicate",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end
