defmodule Envoy.Extensions.Filters.Http.CustomResponse.V3.CustomResponse do
  @moduledoc """
  The filter configuration is a collection of custom response
  policies in a matcher tree. The configuration can be defined at the filter,
  virtual host or route level. The response will be matched against the most
  specific to the least specific config, till a match is found.
  [#protodoc-title: Custom Response Filter]
  [#extension: envoy.filters.http.custom_response]
  The Custom Response Filter allows for replacing upstream responses.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :custom_response_matcher, 1,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "customResponseMatcher"
end
