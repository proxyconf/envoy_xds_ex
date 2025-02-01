defmodule Validate.PbExtension do
  use Protobuf, protoc_gen_elixir_version: "0.14.0"

  extend Google.Protobuf.MessageOptions, :disabled, 1071, optional: true, type: :bool

  extend Google.Protobuf.MessageOptions, :ignored, 1072, optional: true, type: :bool

  extend Google.Protobuf.OneofOptions, :required, 1071, optional: true, type: :bool

  extend Google.Protobuf.FieldOptions, :rules, 1071, optional: true, type: Validate.FieldRules
end
