defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.RemoveFieldAction do
  @moduledoc """
  Specifies an :ref:`Unified Matcher API <envoy_v3_api_msg_.xds.type.matcher.v3.Matcher>` action to remove a field.
  This actual action needs to be implemented by the filter using it.
  [#protodoc-title: Proto API Scrubber Matcher Actions]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.proto_api_scrubber.v3.RemoveFieldAction",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end
