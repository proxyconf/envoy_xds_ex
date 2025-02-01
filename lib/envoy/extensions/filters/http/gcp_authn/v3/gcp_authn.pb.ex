defmodule Envoy.Extensions.Filters.Http.GcpAuthn.V3.GcpAuthnFilterConfig do
  @moduledoc """
  Filter configuration.
  [#next-free-field: 7]
  [#protodoc-title: GCP authentication]
  GCP authentication :ref:`configuration overview <config_http_filters_gcp_authn>`.
  [#extension: envoy.filters.http.gcp_authn]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http_uri, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "httpUri", deprecated: true
  field :retry_policy, 2, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"

  field :cache_config, 3,
    type: Envoy.Extensions.Filters.Http.GcpAuthn.V3.TokenCacheConfig,
    json_name: "cacheConfig"

  field :token_header, 4,
    type: Envoy.Extensions.Filters.Http.GcpAuthn.V3.TokenHeader,
    json_name: "tokenHeader"

  field :cluster, 5, type: :string
  field :timeout, 6, type: Google.Protobuf.Duration, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.GcpAuthn.V3.Audience do
  @moduledoc """
  Audience is the URL of the receiving service that performs token authentication.
  It will be provided to the filter through cluster's typed_filter_metadata.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :url, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.GcpAuthn.V3.TokenCacheConfig do
  @moduledoc """
  Token Cache configuration.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cache_size, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "cacheSize",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.GcpAuthn.V3.TokenHeader do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :value_prefix, 2, type: :string, json_name: "valuePrefix", deprecated: false
end
