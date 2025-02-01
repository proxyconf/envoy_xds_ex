defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.TransportType do
  @moduledoc """
  Thrift transport types supported by Envoy.
  [#protodoc-title: Thrift Proxy]
  Thrift Proxy :ref:`configuration overview <config_network_filters_thrift_proxy>`.
  [#extension: envoy.filters.network.thrift_proxy]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :AUTO_TRANSPORT, 0
  field :FRAMED, 1
  field :UNFRAMED, 2
  field :HEADER, 3
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.ProtocolType do
  @moduledoc """
  Thrift Protocol types supported by Envoy.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :AUTO_PROTOCOL, 0
  field :BINARY, 1
  field :LAX_BINARY, 2
  field :COMPACT, 3
  field :TWITTER, 4
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.Trds do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false

  field :route_config_name, 2, type: :string, json_name: "routeConfigName"
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.ThriftProxy do
  @moduledoc """
  [#next-free-field: 11]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :transport, 2,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.TransportType,
    enum: true,
    deprecated: false

  field :protocol, 3,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.ProtocolType,
    enum: true,
    deprecated: false

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :route_config, 4,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.RouteConfiguration,
    json_name: "routeConfig",
    deprecated: false

  field :trds, 8, type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.Trds, deprecated: false

  field :thrift_filters, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.ThriftFilter,
    json_name: "thriftFilters"

  field :payload_passthrough, 6, type: :bool, json_name: "payloadPassthrough"

  field :max_requests_per_connection, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestsPerConnection"

  field :access_log, 9,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :header_keys_preserve_case, 10, type: :bool, json_name: "headerKeysPreserveCase"
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.ThriftFilter do
  @moduledoc """
  ThriftFilter configures a Thrift filter.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.ThriftProtocolOptions do
  @moduledoc """
  ThriftProtocolOptions specifies Thrift upstream protocol options. This object is used in
  in
  :ref:`typed_extension_protocol_options<envoy_v3_api_field_config.cluster.v3.Cluster.typed_extension_protocol_options>`,
  keyed by the name ``envoy.filters.network.thrift_proxy``.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :transport, 1,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.TransportType,
    enum: true,
    deprecated: false

  field :protocol, 2,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.ProtocolType,
    enum: true,
    deprecated: false
end
