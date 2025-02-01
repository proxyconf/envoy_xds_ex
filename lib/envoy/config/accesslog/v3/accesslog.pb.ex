defmodule Envoy.Config.Accesslog.V3.ComparisonFilter.Op do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :EQ, 0
  field :GE, 1
  field :LE, 2
end

defmodule Envoy.Config.Accesslog.V3.GrpcStatusFilter.Status do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :OK, 0
  field :CANCELED, 1
  field :UNKNOWN, 2
  field :INVALID_ARGUMENT, 3
  field :DEADLINE_EXCEEDED, 4
  field :NOT_FOUND, 5
  field :ALREADY_EXISTS, 6
  field :PERMISSION_DENIED, 7
  field :RESOURCE_EXHAUSTED, 8
  field :FAILED_PRECONDITION, 9
  field :ABORTED, 10
  field :OUT_OF_RANGE, 11
  field :UNIMPLEMENTED, 12
  field :INTERNAL, 13
  field :UNAVAILABLE, 14
  field :DATA_LOSS, 15
  field :UNAUTHENTICATED, 16
end

defmodule Envoy.Config.Accesslog.V3.AccessLog do
  @moduledoc """
  [#protodoc-title: Common access log types]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string
  field :filter, 2, type: Envoy.Config.Accesslog.V3.AccessLogFilter
  field :typed_config, 4, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Accesslog.V3.AccessLogFilter do
  @moduledoc """
  [#next-free-field: 14]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :filter_specifier, 0

  field :status_code_filter, 1,
    type: Envoy.Config.Accesslog.V3.StatusCodeFilter,
    json_name: "statusCodeFilter",
    oneof: 0

  field :duration_filter, 2,
    type: Envoy.Config.Accesslog.V3.DurationFilter,
    json_name: "durationFilter",
    oneof: 0

  field :not_health_check_filter, 3,
    type: Envoy.Config.Accesslog.V3.NotHealthCheckFilter,
    json_name: "notHealthCheckFilter",
    oneof: 0

  field :traceable_filter, 4,
    type: Envoy.Config.Accesslog.V3.TraceableFilter,
    json_name: "traceableFilter",
    oneof: 0

  field :runtime_filter, 5,
    type: Envoy.Config.Accesslog.V3.RuntimeFilter,
    json_name: "runtimeFilter",
    oneof: 0

  field :and_filter, 6,
    type: Envoy.Config.Accesslog.V3.AndFilter,
    json_name: "andFilter",
    oneof: 0

  field :or_filter, 7, type: Envoy.Config.Accesslog.V3.OrFilter, json_name: "orFilter", oneof: 0

  field :header_filter, 8,
    type: Envoy.Config.Accesslog.V3.HeaderFilter,
    json_name: "headerFilter",
    oneof: 0

  field :response_flag_filter, 9,
    type: Envoy.Config.Accesslog.V3.ResponseFlagFilter,
    json_name: "responseFlagFilter",
    oneof: 0

  field :grpc_status_filter, 10,
    type: Envoy.Config.Accesslog.V3.GrpcStatusFilter,
    json_name: "grpcStatusFilter",
    oneof: 0

  field :extension_filter, 11,
    type: Envoy.Config.Accesslog.V3.ExtensionFilter,
    json_name: "extensionFilter",
    oneof: 0

  field :metadata_filter, 12,
    type: Envoy.Config.Accesslog.V3.MetadataFilter,
    json_name: "metadataFilter",
    oneof: 0

  field :log_type_filter, 13,
    type: Envoy.Config.Accesslog.V3.LogTypeFilter,
    json_name: "logTypeFilter",
    oneof: 0
end

defmodule Envoy.Config.Accesslog.V3.ComparisonFilter do
  @moduledoc """
  Filter on an integer comparison.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :op, 1, type: Envoy.Config.Accesslog.V3.ComparisonFilter.Op, enum: true, deprecated: false
  field :value, 2, type: Envoy.Config.Core.V3.RuntimeUInt32, deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.StatusCodeFilter do
  @moduledoc """
  Filters on HTTP response/status code.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :comparison, 1, type: Envoy.Config.Accesslog.V3.ComparisonFilter, deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.DurationFilter do
  @moduledoc """
  Filters based on the duration of the request or stream, in milliseconds.
  For end of stream access logs, the total duration of the stream will be used.
  For :ref:`periodic access logs<arch_overview_access_log_periodic>`,
  the duration of the stream at the time of log recording will be used.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :comparison, 1, type: Envoy.Config.Accesslog.V3.ComparisonFilter, deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.NotHealthCheckFilter do
  @moduledoc """
  Filters for requests that are not health check requests. A health check
  request is marked by the health check filter.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Accesslog.V3.TraceableFilter do
  @moduledoc """
  Filters for requests that are traceable. See the tracing overview for more
  information on how a request becomes traceable.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Accesslog.V3.RuntimeFilter do
  @moduledoc """
  Filters requests based on runtime-configurable sampling rates.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :runtime_key, 1, type: :string, json_name: "runtimeKey", deprecated: false
  field :percent_sampled, 2, type: Envoy.Type.V3.FractionalPercent, json_name: "percentSampled"
  field :use_independent_randomness, 3, type: :bool, json_name: "useIndependentRandomness"
end

defmodule Envoy.Config.Accesslog.V3.AndFilter do
  @moduledoc """
  Performs a logical “and” operation on the result of each filter in filters.
  Filters are evaluated sequentially and if one of them returns false, the
  filter returns false immediately.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :filters, 1,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLogFilter,
    deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.OrFilter do
  @moduledoc """
  Performs a logical “or” operation on the result of each individual filter.
  Filters are evaluated sequentially and if one of them returns true, the
  filter returns true immediately.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :filters, 2,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLogFilter,
    deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.HeaderFilter do
  @moduledoc """
  Filters requests based on the presence or value of a request header.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header, 1, type: Envoy.Config.Route.V3.HeaderMatcher, deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.ResponseFlagFilter do
  @moduledoc """
  Filters requests that received responses with an Envoy response flag set.
  A list of the response flags can be found
  in the access log formatter
  :ref:`documentation<config_access_log_format_response_flags>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :flags, 1, repeated: true, type: :string, deprecated: false
end

defmodule Envoy.Config.Accesslog.V3.GrpcStatusFilter do
  @moduledoc """
  Filters gRPC requests based on their response status. If a gRPC status is not
  provided, the filter will infer the status from the HTTP status code.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :statuses, 1,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.GrpcStatusFilter.Status,
    enum: true,
    deprecated: false

  field :exclude, 2, type: :bool
end

defmodule Envoy.Config.Accesslog.V3.MetadataFilter do
  @moduledoc """
  Filters based on matching dynamic metadata.
  If the matcher path and key correspond to an existing key in dynamic
  metadata, the request is logged only if the matcher value is equal to the
  metadata value. If the matcher path and key *do not* correspond to an
  existing key in dynamic metadata, the request is logged only if
  match_if_key_not_found is "true" or unset.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :matcher, 1, type: Envoy.Type.Matcher.V3.MetadataMatcher

  field :match_if_key_not_found, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "matchIfKeyNotFound"
end

defmodule Envoy.Config.Accesslog.V3.LogTypeFilter do
  @moduledoc """
  Filters based on access log type.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :types, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.AccessLogType,
    enum: true,
    deprecated: false

  field :exclude, 2, type: :bool
end

defmodule Envoy.Config.Accesslog.V3.ExtensionFilter do
  @moduledoc """
  Extension filter is statically registered at runtime.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end
