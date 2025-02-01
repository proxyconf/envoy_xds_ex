defmodule Envoy.Extensions.Filters.Http.Composite.V3.Composite do
  @moduledoc """
  :ref:`Composite filter <config_http_filters_composite>` config. The composite filter config
  allows delegating filter handling to another filter as determined by matching on the request
  headers. This makes it possible to use different filters or filter configurations based on the
  incoming request.

  This is intended to be used with
  :ref:`ExtensionWithMatcher <envoy_v3_api_msg_extensions.common.matching.v3.ExtensionWithMatcher>`
  where a match tree is specified that indicates (via
  :ref:`ExecuteFilterAction <envoy_v3_api_msg_extensions.filters.http.composite.v3.ExecuteFilterAction>`)
  which filter configuration to create and delegate to.
  [#protodoc-title: Composite]
  Composite Filter :ref:`configuration overview <config_http_filters_composite>`.
  [#extension: envoy.filters.http.composite]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.Composite.V3.DynamicConfig do
  @moduledoc """
  Configuration for an extension configuration discovery service with name.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :config_discovery, 2,
    type: Envoy.Config.Core.V3.ExtensionConfigSource,
    json_name: "configDiscovery"
end

defmodule Envoy.Extensions.Filters.Http.Composite.V3.ExecuteFilterAction do
  @moduledoc """
  Composite match action (see :ref:`matching docs <arch_overview_matching_api>` for more info on match actions).
  This specifies the filter configuration of the filter that the composite filter should delegate filter interactions to.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :typed_config, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedConfig",
    deprecated: false

  field :dynamic_config, 2,
    type: Envoy.Extensions.Filters.Http.Composite.V3.DynamicConfig,
    json_name: "dynamicConfig",
    deprecated: false

  field :sample_percent, 3,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "samplePercent"
end
