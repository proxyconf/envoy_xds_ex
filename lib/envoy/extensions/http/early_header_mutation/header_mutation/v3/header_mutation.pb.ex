defmodule Envoy.Extensions.Http.EarlyHeaderMutation.HeaderMutation.V3.HeaderMutation do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :mutations, 1,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    deprecated: false
end