defmodule Envoy.Extensions.ResourceMonitors.InjectedResource.V3.InjectedResourceConfig do
  @moduledoc """
  The injected resource monitor allows injecting a synthetic resource pressure into Envoy
  via a text file, which must contain a floating-point number in the range [0..1] representing
  the resource pressure and be updated atomically by a symbolic link swap.
  This is intended primarily for integration tests to force Envoy into an overloaded state.
  [#protodoc-title: Injected resource]
  [#extension: envoy.resource_monitors.injected_resource]
  """

  use Protobuf,
    full_name: "envoy.extensions.resource_monitors.injected_resource.v3.InjectedResourceConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :filename, 1, type: :string, deprecated: false
end
