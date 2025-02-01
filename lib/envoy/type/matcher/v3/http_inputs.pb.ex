defmodule Envoy.Type.Matcher.V3.HttpRequestHeaderMatchInput do
  @moduledoc """
  Match input indicates that matching should be done on a specific request header.
  The resulting input string will be all headers for the given key joined by a comma,
  e.g. if the request contains two 'foo' headers with value 'bar' and 'baz', the input
  string will be 'bar,baz'.
  [#comment:TODO(snowp): Link to unified matching docs.]
  [#extension: envoy.matching.inputs.request_headers]
  [#protodoc-title: Common HTTP inputs]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpRequestTrailerMatchInput do
  @moduledoc """
  Match input indicates that matching should be done on a specific request trailer.
  The resulting input string will be all headers for the given key joined by a comma,
  e.g. if the request contains two 'foo' headers with value 'bar' and 'baz', the input
  string will be 'bar,baz'.
  [#comment:TODO(snowp): Link to unified matching docs.]
  [#extension: envoy.matching.inputs.request_trailers]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpResponseHeaderMatchInput do
  @moduledoc """
  Match input indicating that matching should be done on a specific response header.
  The resulting input string will be all headers for the given key joined by a comma,
  e.g. if the response contains two 'foo' headers with value 'bar' and 'baz', the input
  string will be 'bar,baz'.
  [#comment:TODO(snowp): Link to unified matching docs.]
  [#extension: envoy.matching.inputs.response_headers]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpResponseTrailerMatchInput do
  @moduledoc """
  Match input indicates that matching should be done on a specific response trailer.
  The resulting input string will be all headers for the given key joined by a comma,
  e.g. if the request contains two 'foo' headers with value 'bar' and 'baz', the input
  string will be 'bar,baz'.
  [#comment:TODO(snowp): Link to unified matching docs.]
  [#extension: envoy.matching.inputs.response_trailers]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpRequestQueryParamMatchInput do
  @moduledoc """
  Match input indicates that matching should be done on a specific query parameter.
  The resulting input string will be the first query parameter for the value
  'query_param'.
  [#extension: envoy.matching.inputs.query_params]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :query_param, 1, type: :string, json_name: "queryParam", deprecated: false
end
