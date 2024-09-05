defmodule Envoy.Type.Matcher.V3.RegexMatcher.GoogleRE2 do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :max_program_size, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxProgramSize",
    deprecated: true
end

defmodule Envoy.Type.Matcher.V3.RegexMatcher do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :engine_type, 0

  field :google_re2, 1,
    type: Envoy.Type.Matcher.V3.RegexMatcher.GoogleRE2,
    json_name: "googleRe2",
    oneof: 0,
    deprecated: true

  field :regex, 2, type: :string, deprecated: false
end

defmodule Envoy.Type.Matcher.V3.RegexMatchAndSubstitute do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :pattern, 1, type: Envoy.Type.Matcher.V3.RegexMatcher, deprecated: false
  field :substitution, 2, type: :string, deprecated: false
end