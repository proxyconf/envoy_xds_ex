defmodule Envoy.Config.Trace.V2.DynamicOtConfig do
  @moduledoc """
  DynamicOtConfig is used to dynamically load a tracer from a shared library
  that implements the `OpenTracing dynamic loading API
  <https://github.com/opentracing/opentracing-cpp>`_.
  [#extension: envoy.tracers.dynamic_ot]
  [#protodoc-title: Dynamically loadable OpenTracing tracer]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :library, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct
end
