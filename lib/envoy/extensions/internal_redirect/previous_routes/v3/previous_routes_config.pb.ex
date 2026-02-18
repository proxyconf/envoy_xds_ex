defmodule Envoy.Extensions.InternalRedirect.PreviousRoutes.V3.PreviousRoutesConfig do
  @moduledoc """
  An internal redirect predicate that rejects redirect targets that are pointing
  to a route that has been followed by a previous redirect from the current route.
  [#extension: envoy.internal_redirect_predicates.previous_routes]
  [#protodoc-title: Previous routes internal redirect predicate]
  """

  use Protobuf,
    full_name: "envoy.extensions.internal_redirect.previous_routes.v3.PreviousRoutesConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end
