defmodule Envoy.Api.V2.Core.ApiVersion do
  @moduledoc """
  xDS API version. This is used to describe both resource and transport
  protocol versions (in distinct configuration fields).
  [#protodoc-title: Configuration sources]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :AUTO, 0
  field :V2, 1
  field :V3, 2
end

defmodule Envoy.Api.V2.Core.ApiConfigSource.ApiType do
  @moduledoc """
  APIs may be fetched via either REST or gRPC.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSUPPORTED_REST_LEGACY, 0
  field :REST, 1
  field :GRPC, 2
  field :DELTA_GRPC, 3
end

defmodule Envoy.Api.V2.Core.ApiConfigSource do
  @moduledoc """
  API configuration source. This identifies the API type and cluster that Envoy
  will use to fetch an xDS API.
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :api_type, 1,
    type: Envoy.Api.V2.Core.ApiConfigSource.ApiType,
    json_name: "apiType",
    enum: true,
    deprecated: false

  field :transport_api_version, 8,
    type: Envoy.Api.V2.Core.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false

  field :cluster_names, 2, repeated: true, type: :string, json_name: "clusterNames"

  field :grpc_services, 4,
    repeated: true,
    type: Envoy.Api.V2.Core.GrpcService,
    json_name: "grpcServices"

  field :refresh_delay, 3, type: Google.Protobuf.Duration, json_name: "refreshDelay"

  field :request_timeout, 5,
    type: Google.Protobuf.Duration,
    json_name: "requestTimeout",
    deprecated: false

  field :rate_limit_settings, 6,
    type: Envoy.Api.V2.Core.RateLimitSettings,
    json_name: "rateLimitSettings"

  field :set_node_on_first_message_only, 7, type: :bool, json_name: "setNodeOnFirstMessageOnly"
end

defmodule Envoy.Api.V2.Core.AggregatedConfigSource do
  @moduledoc """
  Aggregated Discovery Service (ADS) options. This is currently empty, but when
  set in :ref:`ConfigSource <envoy_api_msg_core.ConfigSource>` can be used to
  specify that ADS is to be used.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Api.V2.Core.SelfConfigSource do
  @moduledoc """
  [#not-implemented-hide:]
  Self-referencing config source options. This is currently empty, but when
  set in :ref:`ConfigSource <envoy_api_msg_core.ConfigSource>` can be used to
  specify that other data can be obtained from the same server.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :transport_api_version, 1,
    type: Envoy.Api.V2.Core.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false
end

defmodule Envoy.Api.V2.Core.RateLimitSettings do
  @moduledoc """
  Rate Limit settings to be applied for discovery requests made by Envoy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_tokens, 1, type: Google.Protobuf.UInt32Value, json_name: "maxTokens"
  field :fill_rate, 2, type: Google.Protobuf.DoubleValue, json_name: "fillRate", deprecated: false
end

defmodule Envoy.Api.V2.Core.ConfigSource do
  @moduledoc """
  Configuration for :ref:`listeners <config_listeners>`, :ref:`clusters
  <config_cluster_manager>`, :ref:`routes
  <envoy_api_msg_RouteConfiguration>`, :ref:`endpoints
  <arch_overview_service_discovery>` etc. may either be sourced from the
  filesystem or from an xDS API source. Filesystem configs are watched with
  inotify for updates.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_source_specifier, 0

  field :path, 1, type: :string, oneof: 0

  field :api_config_source, 2,
    type: Envoy.Api.V2.Core.ApiConfigSource,
    json_name: "apiConfigSource",
    oneof: 0

  field :ads, 3, type: Envoy.Api.V2.Core.AggregatedConfigSource, oneof: 0
  field :self, 5, type: Envoy.Api.V2.Core.SelfConfigSource, oneof: 0

  field :initial_fetch_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "initialFetchTimeout"

  field :resource_api_version, 6,
    type: Envoy.Api.V2.Core.ApiVersion,
    json_name: "resourceApiVersion",
    enum: true,
    deprecated: false
end
