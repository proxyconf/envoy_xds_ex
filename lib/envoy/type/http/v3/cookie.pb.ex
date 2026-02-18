defmodule Envoy.Type.Http.V3.Cookie do
  @moduledoc """
  Cookie defines an API for obtaining or generating HTTP cookie.
  [#protodoc-title: HTTP cookie API]
  """

  use Protobuf,
    full_name: "envoy.type.http.v3.Cookie",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :ttl, 2, type: Google.Protobuf.Duration, deprecated: false
  field :path, 3, type: :string
  field :attributes, 4, repeated: true, type: Envoy.Type.Http.V3.CookieAttribute
end

defmodule Envoy.Type.Http.V3.CookieAttribute do
  @moduledoc """
  CookieAttribute defines an API for adding additional attributes for a HTTP cookie.
  """

  use Protobuf,
    full_name: "envoy.type.http.v3.CookieAttribute",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :value, 2, type: :string, deprecated: false
end
