defmodule Envoy.Extensions.Path.Rewrite.UriTemplate.V3.UriTemplateRewriteConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :path_template_rewrite, 1,
    type: :string,
    json_name: "pathTemplateRewrite",
    deprecated: false
end