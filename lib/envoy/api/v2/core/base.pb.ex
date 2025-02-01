defmodule Envoy.Api.V2.Core.RoutingPriority do
  @moduledoc """
  Envoy supports :ref:`upstream priority routing
  <arch_overview_http_routing_priority>` both at the route and the virtual
  cluster level. The current priority implementation uses different connection
  pool and circuit breaking settings for each priority level. This means that
  even for HTTP/2 requests, two physical connections will be used to an
  upstream host. In the future Envoy will likely support true HTTP/2 priority
  over a single upstream connection.
  [#protodoc-title: Common types]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEFAULT, 0
  field :HIGH, 1
end

defmodule Envoy.Api.V2.Core.RequestMethod do
  @moduledoc """
  HTTP request method.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :METHOD_UNSPECIFIED, 0
  field :GET, 1
  field :HEAD, 2
  field :POST, 3
  field :PUT, 4
  field :DELETE, 5
  field :CONNECT, 6
  field :OPTIONS, 7
  field :TRACE, 8
  field :PATCH, 9
end

defmodule Envoy.Api.V2.Core.TrafficDirection do
  @moduledoc """
  Identifies the direction of the traffic relative to the local Envoy.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSPECIFIED, 0
  field :INBOUND, 1
  field :OUTBOUND, 2
end

defmodule Envoy.Api.V2.Core.Locality do
  @moduledoc """
  Identifies location of where either Envoy runs or where upstream hosts run.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :region, 1, type: :string
  field :zone, 2, type: :string
  field :sub_zone, 3, type: :string, json_name: "subZone"
end

defmodule Envoy.Api.V2.Core.BuildVersion do
  @moduledoc """
  BuildVersion combines SemVer version of extension with free-form build information
  (i.e. 'alpha', 'private-build') as a set of strings.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version, 1, type: Envoy.Type.SemanticVersion
  field :metadata, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Api.V2.Core.Extension do
  @moduledoc """
  Version and identification for an Envoy extension.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :category, 2, type: :string
  field :type_descriptor, 3, type: :string, json_name: "typeDescriptor"
  field :version, 4, type: Envoy.Api.V2.Core.BuildVersion
  field :disabled, 5, type: :bool
end

defmodule Envoy.Api.V2.Core.Node do
  @moduledoc """
  Identifies a specific Envoy instance. The node identifier is presented to the
  management server, which may use this identifier to distinguish per Envoy
  configuration for serving.
  [#next-free-field: 12]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :user_agent_version_type, 0

  field :id, 1, type: :string
  field :cluster, 2, type: :string
  field :metadata, 3, type: Google.Protobuf.Struct
  field :locality, 4, type: Envoy.Api.V2.Core.Locality
  field :build_version, 5, type: :string, json_name: "buildVersion", deprecated: true
  field :user_agent_name, 6, type: :string, json_name: "userAgentName"
  field :user_agent_version, 7, type: :string, json_name: "userAgentVersion", oneof: 0

  field :user_agent_build_version, 8,
    type: Envoy.Api.V2.Core.BuildVersion,
    json_name: "userAgentBuildVersion",
    oneof: 0

  field :extensions, 9, repeated: true, type: Envoy.Api.V2.Core.Extension
  field :client_features, 10, repeated: true, type: :string, json_name: "clientFeatures"

  field :listening_addresses, 11,
    repeated: true,
    type: Envoy.Api.V2.Core.Address,
    json_name: "listeningAddresses"
end

defmodule Envoy.Api.V2.Core.Metadata.FilterMetadataEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Api.V2.Core.Metadata do
  @moduledoc """
  Metadata provides additional inputs to filters based on matched listeners,
  filter chains, routes and endpoints. It is structured as a map, usually from
  filter name (in reverse DNS format) to metadata specific to the filter. Metadata
  key-values for a filter are merged as connection and request handling occurs,
  with later values for the same key overriding earlier values.

  An example use of metadata is providing additional values to
  http_connection_manager in the envoy.http_connection_manager.access_log
  namespace.

  Another example use of metadata is to per service config info in cluster metadata, which may get
  consumed by multiple filters.

  For load balancing, Metadata provides a means to subset cluster endpoints.
  Endpoints have a Metadata object associated and routes contain a Metadata
  object to match against. There are some well defined metadata used today for
  this purpose:

  * ``{"envoy.lb": {"canary": <bool> }}`` This indicates the canary status of an
  endpoint and is also used during header processing
  (x-envoy-upstream-canary) and for stats purposes.
  [#next-major-version: move to type/metadata/v2]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :filter_metadata, 1,
    repeated: true,
    type: Envoy.Api.V2.Core.Metadata.FilterMetadataEntry,
    json_name: "filterMetadata",
    map: true
end

defmodule Envoy.Api.V2.Core.RuntimeUInt32 do
  @moduledoc """
  Runtime derived uint32 with a default when not specified.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :default_value, 2, type: :uint32, json_name: "defaultValue"
  field :runtime_key, 3, type: :string, json_name: "runtimeKey", deprecated: false
end

defmodule Envoy.Api.V2.Core.RuntimeDouble do
  @moduledoc """
  Runtime derived double with a default when not specified.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :default_value, 1, type: :double, json_name: "defaultValue"
  field :runtime_key, 2, type: :string, json_name: "runtimeKey", deprecated: false
end

defmodule Envoy.Api.V2.Core.RuntimeFeatureFlag do
  @moduledoc """
  Runtime derived bool with a default when not specified.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :default_value, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "defaultValue",
    deprecated: false

  field :runtime_key, 2, type: :string, json_name: "runtimeKey", deprecated: false
end

defmodule Envoy.Api.V2.Core.HeaderValue do
  @moduledoc """
  Header name/value pair.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string, deprecated: false
  field :value, 2, type: :string, deprecated: false
end

defmodule Envoy.Api.V2.Core.HeaderValueOption do
  @moduledoc """
  Header name/value pair plus option to control append behavior.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header, 1, type: Envoy.Api.V2.Core.HeaderValue, deprecated: false
  field :append, 2, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Api.V2.Core.HeaderMap do
  @moduledoc """
  Wrapper for a set of headers.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :headers, 1, repeated: true, type: Envoy.Api.V2.Core.HeaderValue
end

defmodule Envoy.Api.V2.Core.DataSource do
  @moduledoc """
  Data source consisting of either a file or an inline value.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :specifier, 0

  field :filename, 1, type: :string, oneof: 0, deprecated: false
  field :inline_bytes, 2, type: :bytes, json_name: "inlineBytes", oneof: 0, deprecated: false
  field :inline_string, 3, type: :string, json_name: "inlineString", oneof: 0, deprecated: false
end

defmodule Envoy.Api.V2.Core.RetryPolicy do
  @moduledoc """
  The message specifies the retry policy of remote data source when fetching fails.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :retry_back_off, 1, type: Envoy.Api.V2.Core.BackoffStrategy, json_name: "retryBackOff"
  field :num_retries, 2, type: Google.Protobuf.UInt32Value, json_name: "numRetries"
end

defmodule Envoy.Api.V2.Core.RemoteDataSource do
  @moduledoc """
  The message specifies how to fetch data from remote and how to verify it.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http_uri, 1, type: Envoy.Api.V2.Core.HttpUri, json_name: "httpUri", deprecated: false
  field :sha256, 2, type: :string, deprecated: false
  field :retry_policy, 3, type: Envoy.Api.V2.Core.RetryPolicy, json_name: "retryPolicy"
end

defmodule Envoy.Api.V2.Core.AsyncDataSource do
  @moduledoc """
  Async data source which support async data fetch.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :specifier, 0

  field :local, 1, type: Envoy.Api.V2.Core.DataSource, oneof: 0
  field :remote, 2, type: Envoy.Api.V2.Core.RemoteDataSource, oneof: 0
end

defmodule Envoy.Api.V2.Core.TransportSocket do
  @moduledoc """
  Configuration for transport socket in :ref:`listeners <config_listeners>` and
  :ref:`clusters <envoy_api_msg_Cluster>`. If the configuration is
  empty, a default transport socket implementation and configuration will be
  chosen based on the platform and existence of tls_context.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Api.V2.Core.RuntimeFractionalPercent do
  @moduledoc """
  Runtime derived FractionalPercent with defaults for when the numerator or denominator is not
  specified via a runtime key.

  .. note::

  Parsing of the runtime key's data is implemented such that it may be represented as a
  :ref:`FractionalPercent <envoy_api_msg_type.FractionalPercent>` proto represented as JSON/YAML
  and may also be represented as an integer with the assumption that the value is an integral
  percentage out of 100. For instance, a runtime key lookup returning the value "42" would parse
  as a `FractionalPercent` whose numerator is 42 and denominator is HUNDRED.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :default_value, 1,
    type: Envoy.Type.FractionalPercent,
    json_name: "defaultValue",
    deprecated: false

  field :runtime_key, 2, type: :string, json_name: "runtimeKey"
end

defmodule Envoy.Api.V2.Core.ControlPlane do
  @moduledoc """
  Identifies a specific ControlPlane instance that Envoy is connected to.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :identifier, 1, type: :string
end
