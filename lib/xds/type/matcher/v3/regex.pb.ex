defmodule Xds.Type.Matcher.V3.RegexMatcher.GoogleRE2 do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Xds.Type.Matcher.V3.RegexMatcher do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :engine_type, 0

  field :google_re2, 1,
    type: Xds.Type.Matcher.V3.RegexMatcher.GoogleRE2,
    json_name: "googleRe2",
    oneof: 0,
    deprecated: false

  field :regex, 2, type: :string, deprecated: false
end