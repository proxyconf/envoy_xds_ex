defmodule Envoy.Type.Matcher.NodeMatcher do
  @moduledoc """
  Specifies the way to match a Node.
  The match follows AND semantics.
  [#protodoc-title: Node matcher]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node_id, 1, type: Envoy.Type.Matcher.StringMatcher, json_name: "nodeId"

  field :node_metadatas, 2,
    repeated: true,
    type: Envoy.Type.Matcher.StructMatcher,
    json_name: "nodeMetadatas"
end
