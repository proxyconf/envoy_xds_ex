defmodule Udpa.Annotations.PbExtension do
  use Protobuf, protoc_gen_elixir_version: "0.17.0"

  extend Google.Protobuf.MessageOptions, :versioning, 7_881_811,
    optional: true,
    type: Udpa.Annotations.VersioningAnnotation

  extend Google.Protobuf.FieldOptions, :security, 11_122_993,
    optional: true,
    type: Udpa.Annotations.FieldSecurityAnnotation
end
