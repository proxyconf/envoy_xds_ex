defmodule Xds.Type.Matcher.V3.RegexMatcher.GoogleRE2 do
  @moduledoc """
  Google's `RE2 <https://github.com/google/re2>`_ regex engine. The regex
  string must adhere to the documented `syntax
  <https://github.com/google/re2/wiki/Syntax>`_. The engine is designed to
  complete execution in linear time as well as limit the amount of memory
  used.

  Envoy supports program size checking via runtime. The runtime keys
  `re2.max_program_size.error_level` and `re2.max_program_size.warn_level`
  can be set to integers as the maximum program size or complexity that a
  compiled regex can have before an exception is thrown or a warning is
  logged, respectively. `re2.max_program_size.error_level` defaults to 100,
  and `re2.max_program_size.warn_level` has no default if unset (will not
  check/log a warning).

  Envoy emits two stats for tracking the program size of regexes: the
  histogram `re2.program_size`, which records the program size, and the
  counter `re2.exceeded_warn_level`, which is incremented each time the
  program size exceeds the warn level threshold.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Xds.Type.Matcher.V3.RegexMatcher do
  @moduledoc """
  A regex matcher designed for safety when used with untrusted input.
  [#protodoc-title: Regex matcher]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :engine_type, 0

  field :google_re2, 1,
    type: Xds.Type.Matcher.V3.RegexMatcher.GoogleRE2,
    json_name: "googleRe2",
    oneof: 0,
    deprecated: false

  field :regex, 2, type: :string, deprecated: false
end
