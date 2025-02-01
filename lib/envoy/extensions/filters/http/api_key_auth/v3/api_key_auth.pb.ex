defmodule Envoy.Extensions.Filters.Http.ApiKeyAuth.V3.ApiKeyAuth do
  @moduledoc """
  API Key HTTP authentication.

  For example, the following configuration configures the filter to authenticate the clients using
  the API key from the header ``X-API-KEY``. And only the clients with the key ``real-key`` are
  considered as authenticated.

  .. code-block:: yaml

  credentials:
  - key: real-key
  client: user
  key_sources:
  - header: "X-API-KEY"
  [#protodoc-title: APIKey Auth]
  APIKey Auth :ref:`configuration overview <config_http_filters_api_key_auth>`.
  [#extension: envoy.filters.http.api_key_auth]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :credentials, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ApiKeyAuth.V3.Credential,
    deprecated: false

  field :key_sources, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ApiKeyAuth.V3.KeySource,
    json_name: "keySources"
end

defmodule Envoy.Extensions.Filters.Http.ApiKeyAuth.V3.ApiKeyAuthPerRoute do
  @moduledoc """
  API key auth configuration of per route or per virtual host or per route configuration.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :credentials, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ApiKeyAuth.V3.Credential,
    deprecated: false

  field :key_sources, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ApiKeyAuth.V3.KeySource,
    json_name: "keySources"

  field :allowed_clients, 3, repeated: true, type: :string, json_name: "allowedClients"
end

defmodule Envoy.Extensions.Filters.Http.ApiKeyAuth.V3.Credential do
  @moduledoc """
  Single credential entry that contains the API key and the related client id.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string, deprecated: false
  field :client, 2, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.ApiKeyAuth.V3.KeySource do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header, 1, type: :string, deprecated: false
  field :query, 2, type: :string, deprecated: false
  field :cookie, 3, type: :string, deprecated: false
end
