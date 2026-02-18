defmodule Xds.Type.V3.CelExpression do
  @moduledoc """
  Either parsed or checked representation of the `Common Expression Language
  <https://github.com/google/cel-spec>`_ (CEL) program.
  [#protodoc-title: Common Expression Language (CEL)]
  """

  use Protobuf,
    full_name: "xds.type.v3.CelExpression",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :expr_specifier, 0

  field :parsed_expr, 1,
    type: Google.Api.Expr.V1alpha1.ParsedExpr,
    json_name: "parsedExpr",
    oneof: 0

  field :checked_expr, 2,
    type: Google.Api.Expr.V1alpha1.CheckedExpr,
    json_name: "checkedExpr",
    oneof: 0
end

defmodule Xds.Type.V3.CelExtractString do
  @moduledoc """
  Extracts a string by evaluating a `Common Expression Language
  <https://github.com/google/cel-spec>`_ (CEL) expression against the standardized set of
  :ref:`HTTP attributes <arch_overview_attributes>`.

  .. attention::

    Besides CEL evaluation raising an error explicitly, CEL program returning a type other than
    the ``string``, or not returning anything, are considered an error as well.

  [#comment:TODO(sergiitk): When implemented, add the extension tag.]
  """

  use Protobuf,
    full_name: "xds.type.v3.CelExtractString",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :expr_extract, 1,
    type: Xds.Type.V3.CelExpression,
    json_name: "exprExtract",
    deprecated: false

  field :default_value, 2, type: Google.Protobuf.StringValue, json_name: "defaultValue"
end
