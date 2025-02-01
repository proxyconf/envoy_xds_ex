defmodule Envoy.Type.V3.SemanticVersion do
  @moduledoc """
  Envoy uses SemVer (https://semver.org/). Major/minor versions indicate
  expected behaviors and APIs, the patch version field is used only
  for security fixes and can be generally ignored.
  [#protodoc-title: Semantic version]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :major_number, 1, type: :uint32, json_name: "majorNumber"
  field :minor_number, 2, type: :uint32, json_name: "minorNumber"
  field :patch, 3, type: :uint32
end
