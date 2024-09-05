defmodule Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config.InvocationMode do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :SYNCHRONOUS, 0
  field :ASYNCHRONOUS, 1
end

defmodule Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :arn, 1, type: :string, deprecated: false
  field :payload_passthrough, 2, type: :bool, json_name: "payloadPassthrough"

  field :invocation_mode, 3,
    type: Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config.InvocationMode,
    json_name: "invocationMode",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.AwsLambda.V2alpha.PerRouteConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :invoke_config, 1,
    type: Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config,
    json_name: "invokeConfig"
end