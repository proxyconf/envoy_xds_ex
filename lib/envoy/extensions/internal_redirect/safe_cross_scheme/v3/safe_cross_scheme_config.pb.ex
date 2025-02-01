defmodule Envoy.Extensions.InternalRedirect.SafeCrossScheme.V3.SafeCrossSchemeConfig do
  @moduledoc """
  An internal redirect predicate that checks the scheme between the
  downstream url and the redirect target url and allows a) same scheme
  redirect and b) safe cross scheme redirect, which means if the downstream
  scheme is HTTPS, both HTTPS and HTTP redirect targets are allowed, but if the
  downstream scheme is HTTP, only HTTP redirect targets are allowed.
  [#extension: envoy.internal_redirect_predicates.safe_cross_scheme]
  [#protodoc-title: SafeCrossScheme internal redirect predicate]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end
