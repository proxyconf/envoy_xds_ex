defmodule Envoy.Extensions.Retry.Host.OmitCanaryHosts.V3.OmitCanaryHostsPredicate do
  @moduledoc """
  [#protodoc-title: Omit Canary Hosts Predicate]
  [#extension: envoy.retry_host_predicates.omit_canary_hosts]
  """

  use Protobuf,
    full_name: "envoy.extensions.retry.host.omit_canary_hosts.v3.OmitCanaryHostsPredicate",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end
