defmodule Envoy.Extensions.Filters.Http.Transform.V3.BodyTransformation.TransformAction do
  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.transform.v3.BodyTransformation.TransformAction",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :MERGE, 0
  field :REPLACE, 1
end

defmodule Envoy.Extensions.Filters.Http.Transform.V3.TransformConfig do
  @moduledoc """
  Configuration for the transform filter. The filter may buffer the request/response until the
  entire body is received, and then mutate the headers and body according to the contents
  of the request/response. The request and response transformations are independent and could
  be configured separately.
  Only JSON body transformation is supported for now.
  [#protodoc-title: Transform filter configuration]
  Transform filter :ref:`configuration overview <config_http_filters_transform>` to perform
  HTTP header and body transformations.
  [#extension: envoy.filters.http.transform]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.transform.v3.TransformConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :request_transformation, 1,
    type: Envoy.Extensions.Filters.Http.Transform.V3.Transformation,
    json_name: "requestTransformation"

  field :response_transformation, 2,
    type: Envoy.Extensions.Filters.Http.Transform.V3.Transformation,
    json_name: "responseTransformation"

  field :clear_cluster_cache, 3, type: :bool, json_name: "clearClusterCache"
  field :clear_route_cache, 4, type: :bool, json_name: "clearRouteCache"
end

defmodule Envoy.Extensions.Filters.Http.Transform.V3.Transformation do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.transform.v3.Transformation",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :headers_mutations, 1,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    json_name: "headersMutations"

  field :body_transformation, 2,
    type: Envoy.Extensions.Filters.Http.Transform.V3.BodyTransformation,
    json_name: "bodyTransformation"
end

defmodule Envoy.Extensions.Filters.Http.Transform.V3.BodyTransformation do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.transform.v3.BodyTransformation",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :body_format, 1,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "bodyFormat",
    deprecated: false

  field :action, 2,
    type: Envoy.Extensions.Filters.Http.Transform.V3.BodyTransformation.TransformAction,
    enum: true
end
