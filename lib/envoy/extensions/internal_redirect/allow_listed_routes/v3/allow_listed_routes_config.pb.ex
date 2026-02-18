defmodule Envoy.Extensions.InternalRedirect.AllowListedRoutes.V3.AllowListedRoutesConfig do
  @moduledoc """
  An internal redirect predicate that accepts only explicitly allowed target routes.
  [#extension: envoy.internal_redirect_predicates.allow_listed_routes]
  [#protodoc-title: Allow listed routes internal redirect predicate]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.internal_redirect.allow_listed_routes.v3.AllowListedRoutesConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :allowed_route_names, 1,
    repeated: true,
    type: :string,
    json_name: "allowedRouteNames",
    deprecated: false
end
