defmodule Udpa.Annotations.PackageVersionStatus do
  use Protobuf,
    enum: true,
    full_name: "udpa.annotations.PackageVersionStatus",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNKNOWN, 0
  field :FROZEN, 1
  field :ACTIVE, 2
  field :NEXT_MAJOR_VERSION_CANDIDATE, 3
end

defmodule Udpa.Annotations.StatusAnnotation do
  use Protobuf,
    full_name: "udpa.annotations.StatusAnnotation",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :work_in_progress, 1, type: :bool, json_name: "workInProgress"

  field :package_version_status, 2,
    type: Udpa.Annotations.PackageVersionStatus,
    json_name: "packageVersionStatus",
    enum: true
end
