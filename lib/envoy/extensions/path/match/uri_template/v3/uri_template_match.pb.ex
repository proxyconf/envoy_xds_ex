defmodule Envoy.Extensions.Path.Match.UriTemplate.V3.UriTemplateMatchConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :path_template, 1, type: :string, json_name: "pathTemplate", deprecated: false
end