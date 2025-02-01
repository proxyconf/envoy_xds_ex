defmodule Envoy.Extensions.Http.EarlyHeaderMutation.HeaderMutation.V3.HeaderMutation do
  @moduledoc """
  This extension allows for early header mutation by the substitution formatter.
  [#protodoc-title: Default early header mutation extension]
  [#extension: envoy.http.early_header_mutation.header_mutation]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :mutations, 1,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    deprecated: false
end
