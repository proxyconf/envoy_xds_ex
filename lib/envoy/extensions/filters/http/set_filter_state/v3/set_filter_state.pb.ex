defmodule Envoy.Extensions.Filters.Http.SetFilterState.V3.Config do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :on_request_headers, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.SetFilterState.V3.FilterStateValue,
    json_name: "onRequestHeaders"
end