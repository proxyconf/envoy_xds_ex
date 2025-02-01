defmodule Envoy.Type.V3.HashPolicy.SourceIp do
  @moduledoc """
  The source IP will be used to compute the hash used by hash-based load balancing
  algorithms.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Type.V3.HashPolicy.FilterState do
  @moduledoc """
  An Object in the :ref:`filterState <arch_overview_data_sharing_between_filters>` will be used
  to compute the hash used by hash-based load balancing algorithms.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string, deprecated: false
end

defmodule Envoy.Type.V3.HashPolicy do
  @moduledoc """
  Specifies the hash policy
  [#protodoc-title: Hash Policy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :policy_specifier, 0

  field :source_ip, 1, type: Envoy.Type.V3.HashPolicy.SourceIp, json_name: "sourceIp", oneof: 0

  field :filter_state, 2,
    type: Envoy.Type.V3.HashPolicy.FilterState,
    json_name: "filterState",
    oneof: 0
end
