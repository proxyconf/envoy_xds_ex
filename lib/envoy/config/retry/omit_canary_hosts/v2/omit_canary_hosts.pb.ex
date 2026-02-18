defmodule Envoy.Config.Retry.OmitCanaryHosts.V2.OmitCanaryHostsPredicate do
  @moduledoc """
  [#protodoc-title: Omit Canary Hosts Predicate]
  [#extension: envoy.retry_host_predicates.omit_canary_hosts]
  """

  use Protobuf,
    full_name: "envoy.config.retry.omit_canary_hosts.v2.OmitCanaryHostsPredicate",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end
