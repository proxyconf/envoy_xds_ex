defmodule Envoy.Extensions.Common.Matching.V3.ExtensionWithMatcher do
  @moduledoc """
  Wrapper around an existing extension that provides an associated matcher. This allows
  decorating an existing extension with a matcher, which can be used to match against
  relevant protocol data.
  [#protodoc-title: Extension matcher]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :matcher, 1, type: Envoy.Config.Common.Matcher.V3.Matcher, deprecated: true
  field :xds_matcher, 3, type: Xds.Type.Matcher.V3.Matcher, json_name: "xdsMatcher"

  field :extension_config, 2,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "extensionConfig",
    deprecated: false
end

defmodule Envoy.Extensions.Common.Matching.V3.ExtensionWithMatcherPerRoute do
  @moduledoc """
  Extra settings on a per virtualhost/route/weighted-cluster level.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :xds_matcher, 1, type: Xds.Type.Matcher.V3.Matcher, json_name: "xdsMatcher"
end
