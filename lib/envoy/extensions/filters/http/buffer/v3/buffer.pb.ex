defmodule Envoy.Extensions.Filters.Http.Buffer.V3.Buffer do
  @moduledoc """
  [#protodoc-title: Buffer]
  Buffer :ref:`configuration overview <config_http_filters_buffer>`.
  [#extension: envoy.filters.http.buffer]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.buffer.v3.Buffer",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :max_request_bytes, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestBytes",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Buffer.V3.BufferPerRoute do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.buffer.v3.BufferPerRoute",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false

  field :buffer, 2,
    type: Envoy.Extensions.Filters.Http.Buffer.V3.Buffer,
    oneof: 0,
    deprecated: false
end
