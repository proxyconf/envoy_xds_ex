defmodule Envoy.Extensions.RateLimitDescriptors.Expr.V3.Descriptor do
  @moduledoc """
  The following descriptor entry is appended with a value computed
  from a symbolic Common Expression Language expression.
  See :ref:`attributes <arch_overview_attributes>` for the set of
  available attributes.

  .. code-block:: cpp

  ("<descriptor_key>", "<expression_value>")
  [#protodoc-title: Rate limit descriptor expression]
  [#extension: envoy.rate_limit_descriptors.expr]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :expr_specifier, 0

  field :descriptor_key, 1, type: :string, json_name: "descriptorKey", deprecated: false
  field :skip_if_error, 2, type: :bool, json_name: "skipIfError"
  field :text, 3, type: :string, oneof: 0, deprecated: false
  field :parsed, 4, type: Google.Api.Expr.V1alpha1.Expr, oneof: 0
end
