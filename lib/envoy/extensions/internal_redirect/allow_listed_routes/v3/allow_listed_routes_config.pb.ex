defmodule Envoy.Extensions.InternalRedirect.AllowListedRoutes.V3.AllowListedRoutesConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :allowed_route_names, 1,
    repeated: true,
    type: :string,
    json_name: "allowedRouteNames",
    deprecated: false
end