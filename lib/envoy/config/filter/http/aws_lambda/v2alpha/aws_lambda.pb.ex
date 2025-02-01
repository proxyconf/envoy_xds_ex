defmodule Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config.InvocationMode do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :SYNCHRONOUS, 0
  field :ASYNCHRONOUS, 1
end

defmodule Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config do
  @moduledoc """
  AWS Lambda filter config
  [#protodoc-title: AWS Lambda]
  AWS Lambda :ref:`configuration overview <config_http_filters_aws_lambda>`.
  [#extension: envoy.filters.http.aws_lambda]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :arn, 1, type: :string, deprecated: false
  field :payload_passthrough, 2, type: :bool, json_name: "payloadPassthrough"

  field :invocation_mode, 3,
    type: Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config.InvocationMode,
    json_name: "invocationMode",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.AwsLambda.V2alpha.PerRouteConfig do
  @moduledoc """
  Per-route configuration for AWS Lambda. This can be useful when invoking a different Lambda function or a different
  version of the same Lambda depending on the route.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :invoke_config, 1,
    type: Envoy.Config.Filter.Http.AwsLambda.V2alpha.Config,
    json_name: "invokeConfig"
end
