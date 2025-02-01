defmodule Envoy.Extensions.InternalRedirect.PreviousRoutes.V3.PreviousRoutesConfig do
  @moduledoc """
  An internal redirect predicate that rejects redirect targets that are pointing
  to a route that has been followed by a previous redirect from the current route.
  [#extension: envoy.internal_redirect_predicates.previous_routes]
  [#protodoc-title: Previous routes internal redirect predicate]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end
