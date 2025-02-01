defmodule Envoy.Config.Core.V3.ApiVersion do
  @moduledoc """
  xDS API and non-xDS services version. This is used to describe both resource and transport
  protocol versions (in distinct configuration fields).
  [#protodoc-title: Configuration sources]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :AUTO, 0
  field :V2, 1
  field :V3, 2
end

defmodule Envoy.Config.Core.V3.ApiConfigSource.ApiType do
  @moduledoc """
  APIs may be fetched via either REST or gRPC.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEPRECATED_AND_UNAVAILABLE_DO_NOT_USE, 0
  field :REST, 1
  field :GRPC, 2
  field :DELTA_GRPC, 3
  field :AGGREGATED_GRPC, 5
  field :AGGREGATED_DELTA_GRPC, 6
end

defmodule Envoy.Config.Core.V3.ApiConfigSource do
  @moduledoc """
  API configuration source. This identifies the API type and cluster that Envoy
  will use to fetch an xDS API.
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :api_type, 1,
    type: Envoy.Config.Core.V3.ApiConfigSource.ApiType,
    json_name: "apiType",
    enum: true,
    deprecated: false

  field :transport_api_version, 8,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false

  field :cluster_names, 2, repeated: true, type: :string, json_name: "clusterNames"

  field :grpc_services, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcServices"

  field :refresh_delay, 3, type: Google.Protobuf.Duration, json_name: "refreshDelay"

  field :request_timeout, 5,
    type: Google.Protobuf.Duration,
    json_name: "requestTimeout",
    deprecated: false

  field :rate_limit_settings, 6,
    type: Envoy.Config.Core.V3.RateLimitSettings,
    json_name: "rateLimitSettings"

  field :set_node_on_first_message_only, 7, type: :bool, json_name: "setNodeOnFirstMessageOnly"

  field :config_validators, 9,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "configValidators"
end

defmodule Envoy.Config.Core.V3.AggregatedConfigSource do
  @moduledoc """
  Aggregated Discovery Service (ADS) options. This is currently empty, but when
  set in :ref:`ConfigSource <envoy_v3_api_msg_config.core.v3.ConfigSource>` can be used to
  specify that ADS is to be used.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Core.V3.SelfConfigSource do
  @moduledoc """
  [#not-implemented-hide:]
  Self-referencing config source options. This is currently empty, but when
  set in :ref:`ConfigSource <envoy_v3_api_msg_config.core.v3.ConfigSource>` can be used to
  specify that other data can be obtained from the same server.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :transport_api_version, 1,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Core.V3.RateLimitSettings do
  @moduledoc """
  Rate Limit settings to be applied for discovery requests made by Envoy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_tokens, 1, type: Google.Protobuf.UInt32Value, json_name: "maxTokens"
  field :fill_rate, 2, type: Google.Protobuf.DoubleValue, json_name: "fillRate", deprecated: false
end

defmodule Envoy.Config.Core.V3.PathConfigSource do
  @moduledoc """
  Local filesystem path configuration source.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :path, 1, type: :string, deprecated: false

  field :watched_directory, 2,
    type: Envoy.Config.Core.V3.WatchedDirectory,
    json_name: "watchedDirectory"
end

defmodule Envoy.Config.Core.V3.ConfigSource do
  @moduledoc """
  Configuration for :ref:`listeners <config_listeners>`, :ref:`clusters
  <config_cluster_manager>`, :ref:`routes
  <envoy_v3_api_msg_config.route.v3.RouteConfiguration>`, :ref:`endpoints
  <arch_overview_service_discovery>` etc. may either be sourced from the
  filesystem or from an xDS API source. Filesystem configs are watched with
  inotify for updates.
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_source_specifier, 0

  field :authorities, 7, repeated: true, type: Xds.Core.V3.Authority
  field :path, 1, type: :string, oneof: 0, deprecated: true

  field :path_config_source, 8,
    type: Envoy.Config.Core.V3.PathConfigSource,
    json_name: "pathConfigSource",
    oneof: 0

  field :api_config_source, 2,
    type: Envoy.Config.Core.V3.ApiConfigSource,
    json_name: "apiConfigSource",
    oneof: 0

  field :ads, 3, type: Envoy.Config.Core.V3.AggregatedConfigSource, oneof: 0
  field :self, 5, type: Envoy.Config.Core.V3.SelfConfigSource, oneof: 0

  field :initial_fetch_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "initialFetchTimeout"

  field :resource_api_version, 6,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "resourceApiVersion",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Core.V3.ExtensionConfigSource do
  @moduledoc """
  Configuration source specifier for a late-bound extension configuration. The
  parent resource is warmed until all the initial extension configurations are
  received, unless the flag to apply the default configuration is set.
  Subsequent extension updates are atomic on a per-worker basis. Once an
  extension configuration is applied to a request or a connection, it remains
  constant for the duration of processing. If the initial delivery of the
  extension configuration fails, due to a timeout for example, the optional
  default configuration is applied. Without a default configuration, the
  extension is disabled, until an extension configuration is received. The
  behavior of a disabled extension depends on the context. For example, a
  filter chain with a disabled extension filter rejects all incoming streams.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false

  field :default_config, 2, type: Google.Protobuf.Any, json_name: "defaultConfig"

  field :apply_default_config_without_warming, 3,
    type: :bool,
    json_name: "applyDefaultConfigWithoutWarming"

  field :type_urls, 4, repeated: true, type: :string, json_name: "typeUrls", deprecated: false
end
