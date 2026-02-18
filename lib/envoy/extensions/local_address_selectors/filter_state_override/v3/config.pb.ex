defmodule Envoy.Extensions.LocalAddressSelectors.FilterStateOverride.V3.Config do
  @moduledoc """
  Overrides the upstream bind address Linux network namespace using a filter
  state object with the key ``envoy.network.upstream_bind_override.network_namespace``
  passed from the downstream. The override applies over the :ref:`default
  address selector
  <extension_envoy.upstream.local_address_selector.default_local_address_selector>`
  [#protodoc-title: Linux Network Namespace Local Address Selector]
  [#extension: envoy.upstream.local_address_selector.filter_state_override]
  """

  use Protobuf,
    full_name: "envoy.extensions.local_address_selectors.filter_state_override.v3.Config",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end
