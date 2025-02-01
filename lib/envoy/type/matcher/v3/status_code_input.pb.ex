defmodule Envoy.Type.Matcher.V3.HttpResponseStatusCodeMatchInput do
  @moduledoc """
  Match input indicates that matching should be done on the response status
  code.
  [#protodoc-title: Common HTTP Inputs]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Type.Matcher.V3.HttpResponseStatusCodeClassMatchInput do
  @moduledoc """
  Match input indicates that the matching should be done on the class of the
  response status code. For eg: 1xx, 2xx, 3xx, 4xx or 5xx.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end
