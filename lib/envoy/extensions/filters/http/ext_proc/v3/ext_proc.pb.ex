defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExternalProcessor.RouteCacheAction do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :DEFAULT, 0
  field :CLEAR, 1
  field :RETAIN, 2
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExternalProcessor do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :http_service, 20,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcHttpService,
    json_name: "httpService",
    deprecated: false

  field :failure_mode_allow, 2, type: :bool, json_name: "failureModeAllow"

  field :processing_mode, 3,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode,
    json_name: "processingMode"

  field :request_attributes, 5, repeated: true, type: :string, json_name: "requestAttributes"
  field :response_attributes, 6, repeated: true, type: :string, json_name: "responseAttributes"

  field :message_timeout, 7,
    type: Google.Protobuf.Duration,
    json_name: "messageTimeout",
    deprecated: false

  field :stat_prefix, 8, type: :string, json_name: "statPrefix"

  field :mutation_rules, 9,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutationRules,
    json_name: "mutationRules"

  field :max_message_timeout, 10,
    type: Google.Protobuf.Duration,
    json_name: "maxMessageTimeout",
    deprecated: false

  field :forward_rules, 12,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.HeaderForwardingRules,
    json_name: "forwardRules"

  field :filter_metadata, 13, type: Google.Protobuf.Struct, json_name: "filterMetadata"
  field :allow_mode_override, 14, type: :bool, json_name: "allowModeOverride"
  field :disable_immediate_response, 15, type: :bool, json_name: "disableImmediateResponse"

  field :metadata_options, 16,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions,
    json_name: "metadataOptions"

  field :observability_mode, 17, type: :bool, json_name: "observabilityMode"

  field :disable_clear_route_cache, 11,
    type: :bool,
    json_name: "disableClearRouteCache",
    deprecated: false

  field :route_cache_action, 18,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ExternalProcessor.RouteCacheAction,
    json_name: "routeCacheAction",
    enum: true,
    deprecated: false

  field :deferred_close_timeout, 19,
    type: Google.Protobuf.Duration,
    json_name: "deferredCloseTimeout"

  field :send_body_without_waiting_for_header_response, 21,
    type: :bool,
    json_name: "sendBodyWithoutWaitingForHeaderResponse"
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcHttpService do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :http_service, 1, type: Envoy.Config.Core.V3.HttpService, json_name: "httpService"
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions.MetadataNamespaces do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :untyped, 1, repeated: true, type: :string
  field :typed, 2, repeated: true, type: :string
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :forwarding_namespaces, 1,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions.MetadataNamespaces,
    json_name: "forwardingNamespaces"

  field :receiving_namespaces, 2,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions.MetadataNamespaces,
    json_name: "receivingNamespaces"
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.HeaderForwardingRules do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :allowed_headers, 1,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "allowedHeaders"

  field :disallowed_headers, 2,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "disallowedHeaders"
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcPerRoute do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false
  field :overrides, 2, type: Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcOverrides, oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcOverrides do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :processing_mode, 1,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode,
    json_name: "processingMode"

  field :async_mode, 2, type: :bool, json_name: "asyncMode"
  field :request_attributes, 3, repeated: true, type: :string, json_name: "requestAttributes"
  field :response_attributes, 4, repeated: true, type: :string, json_name: "responseAttributes"
  field :grpc_service, 5, type: Envoy.Config.Core.V3.GrpcService, json_name: "grpcService"

  field :metadata_options, 6,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions,
    json_name: "metadataOptions"

  field :grpc_initial_metadata, 7,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValue,
    json_name: "grpcInitialMetadata"
end