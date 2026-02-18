defmodule Envoy.Extensions.Filters.Http.Mcp.V3.Mcp.TrafficMode do
  @moduledoc """
  Traffic handling mode for non-MCP traffic.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.mcp.v3.Mcp.TrafficMode",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :PASS_THROUGH, 0
  field :REJECT_NO_MCP, 1
end

defmodule Envoy.Extensions.Filters.Http.Mcp.V3.Mcp.RequestStorageMode do
  @moduledoc """
  Where to store parsed MCP request attributes.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.mcp.v3.Mcp.RequestStorageMode",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :MODE_UNSPECIFIED, 0
  field :DYNAMIC_METADATA, 1
  field :FILTER_STATE, 2
  field :DYNAMIC_METADATA_AND_FILTER_STATE, 3
end

defmodule Envoy.Extensions.Filters.Http.Mcp.V3.Mcp do
  @moduledoc """
  This filter will inspect and get attributes from MCP traffic.
  [#next-free-field: 6]
  [#protodoc-title: MCP]
  MCP filter :ref:`configuration overview <config_http_filters_mcp>`.
  [#extension: envoy.filters.http.mcp]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp.v3.Mcp",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :traffic_mode, 1,
    type: Envoy.Extensions.Filters.Http.Mcp.V3.Mcp.TrafficMode,
    json_name: "trafficMode",
    enum: true,
    deprecated: false

  field :clear_route_cache, 2, type: :bool, json_name: "clearRouteCache"

  field :max_request_body_size, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestBodySize",
    deprecated: false

  field :parser_config, 4,
    type: Envoy.Extensions.Filters.Http.Mcp.V3.ParserConfig,
    json_name: "parserConfig"

  field :request_storage_mode, 5,
    type: Envoy.Extensions.Filters.Http.Mcp.V3.Mcp.RequestStorageMode,
    json_name: "requestStorageMode",
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Mcp.V3.ParserConfig.AttributeExtractionRule do
  @moduledoc """
  A single attribute extraction rule.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp.v3.ParserConfig.AttributeExtractionRule",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :path, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Mcp.V3.ParserConfig.MethodConfig do
  @moduledoc """
  Configuration for a specific MCP method.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp.v3.ParserConfig.MethodConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :method, 1, type: :string, deprecated: false
  field :group, 2, type: :string

  field :extraction_rules, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.Mcp.V3.ParserConfig.AttributeExtractionRule,
    json_name: "extractionRules"
end

defmodule Envoy.Extensions.Filters.Http.Mcp.V3.ParserConfig do
  @moduledoc """
  Parser configuration with method-specific rules.
  This configuration allows overriding the default attribute extraction behavior for specific MCP methods.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp.v3.ParserConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :methods, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.Mcp.V3.ParserConfig.MethodConfig

  field :group_metadata_key, 2, type: :string, json_name: "groupMetadataKey"
end

defmodule Envoy.Extensions.Filters.Http.Mcp.V3.McpOverride do
  @moduledoc """
  Per-route override configuration for MCP filter
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp.v3.McpOverride",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :traffic_mode, 1,
    type: Envoy.Extensions.Filters.Http.Mcp.V3.Mcp.TrafficMode,
    json_name: "trafficMode",
    enum: true,
    deprecated: false

  field :max_request_body_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestBodySize",
    deprecated: false
end
