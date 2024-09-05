defmodule Envoy.Config.Filter.Http.Csrf.V2.CsrfPolicy do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :filter_enabled, 1,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "filterEnabled",
    deprecated: false

  field :shadow_enabled, 2,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "shadowEnabled"

  field :additional_origins, 3,
    repeated: true,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "additionalOrigins"
end