defmodule Xds.Annotations.V3.PackageVersionStatus do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :FROZEN, 1
  field :ACTIVE, 2
  field :NEXT_MAJOR_VERSION_CANDIDATE, 3
end

defmodule Xds.Annotations.V3.FileStatusAnnotation do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :work_in_progress, 1, type: :bool, json_name: "workInProgress"
end

defmodule Xds.Annotations.V3.MessageStatusAnnotation do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :work_in_progress, 1, type: :bool, json_name: "workInProgress"
end

defmodule Xds.Annotations.V3.FieldStatusAnnotation do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :work_in_progress, 1, type: :bool, json_name: "workInProgress"
end

defmodule Xds.Annotations.V3.StatusAnnotation do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :work_in_progress, 1, type: :bool, json_name: "workInProgress"

  field :package_version_status, 2,
    type: Xds.Annotations.V3.PackageVersionStatus,
    json_name: "packageVersionStatus",
    enum: true
end
