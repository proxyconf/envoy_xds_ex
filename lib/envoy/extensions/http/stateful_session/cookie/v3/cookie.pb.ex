defmodule Envoy.Extensions.Http.StatefulSession.Cookie.V3.CookieBasedSessionState do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :cookie, 1, type: Envoy.Type.Http.V3.Cookie, deprecated: false
end