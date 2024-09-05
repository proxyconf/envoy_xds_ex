defmodule Envoy.Extensions.Filters.Http.GrpcHttp1ReverseBridge.V3.FilterConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :content_type, 1, type: :string, json_name: "contentType", deprecated: false
  field :withhold_grpc_frames, 2, type: :bool, json_name: "withholdGrpcFrames"

  field :response_size_header, 3,
    type: :string,
    json_name: "responseSizeHeader",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.GrpcHttp1ReverseBridge.V3.FilterConfigPerRoute do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :disabled, 1, type: :bool
end