defmodule Envoy.Service.Extension.V3.EcdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue
  with importing services: https://github.com/google/protobuf/issues/4221 and
  protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Extension.V3.ExtensionConfigDiscoveryService.Service do
  @moduledoc """
  Return extension configurations.
  [#protodoc-title: Extension config discovery service (ECDS)]
  A service that supports dynamic configuration updates for a specific filter.
  Currently, ECDS is supported for network filters, HTTP filters, UDP session filters and Listener filters.
  Please check :ref:`Extension Config Discovery Service (ECDS) API <config_overview_extension_discovery>`.
  The overall extension config discovery service works as follows:

  1. A filter (:ref:`Downstream Network <envoy_v3_api_field_config.listener.v3.Filter.config_discovery>`,
  :ref:`Upstream Network <envoy_v3_api_field_config.cluster.v3.Filter.config_discovery>`,
  :ref:`Listener <envoy_v3_api_field_config.listener.v3.ListenerFilter.config_discovery>`,
  :ref:`UDP Session <envoy_v3_api_field_extensions.filters.udp.udp_proxy.v3.UdpProxyConfig.SessionFilter.config_discovery>`,
  or :ref:`HTTP <envoy_v3_api_field_extensions.filters.network.http_connection_manager.v3.HttpFilter.config_discovery>`)
  contains a :ref:`config_discovery <envoy_v3_api_msg_config.core.v3.ExtensionConfigSource>` configuration. This configuration
  includes a :ref:`config_source <envoy_v3_api_field_config.core.v3.ExtensionConfigSource.config_source>`,
  from which the filter configuration will be fetched.
  2. The client then registers for a resource using the filter name as the resource_name.
  3. The xDS server sends back the filter's configuration.
  4. The client stores the configuration that will be used in the next instantiation of the filter chain,
  i.e., for the next requests. Whenever an updated filter configuration arrives, it will be taken into
  account in the following instantiation of the filter chain.

  Note: Filters that are configured using ECDS are warmed. For more details see
  :ref:`ExtensionConfigSource <envoy_v3_api_msg_config.core.v3.ExtensionConfigSource>`.
  """

  use GRPC.Service,
    name: "envoy.service.extension.v3.ExtensionConfigDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamExtensionConfigs,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaExtensionConfigs,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :FetchExtensionConfigs,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Extension.V3.ExtensionConfigDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Extension.V3.ExtensionConfigDiscoveryService.Service
end
