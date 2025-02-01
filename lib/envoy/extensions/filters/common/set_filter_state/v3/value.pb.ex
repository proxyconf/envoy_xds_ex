defmodule Envoy.Extensions.Filters.Common.SetFilterState.V3.FilterStateValue.SharedWithUpstream do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NONE, 0
  field :ONCE, 1
  field :TRANSITIVE, 2
end

defmodule Envoy.Extensions.Filters.Common.SetFilterState.V3.FilterStateValue do
  @moduledoc """
  A filter state key and value pair.
  [#next-free-field: 7]
  [#protodoc-title: Set-Filter-State filter state value]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :key, 0

  oneof :value, 1

  field :object_key, 1, type: :string, json_name: "objectKey", oneof: 0, deprecated: false
  field :factory_key, 6, type: :string, json_name: "factoryKey"

  field :format_string, 2,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "formatString",
    oneof: 1

  field :read_only, 3, type: :bool, json_name: "readOnly"

  field :shared_with_upstream, 4,
    type: Envoy.Extensions.Filters.Common.SetFilterState.V3.FilterStateValue.SharedWithUpstream,
    json_name: "sharedWithUpstream",
    enum: true

  field :skip_if_empty, 5, type: :bool, json_name: "skipIfEmpty"
end
