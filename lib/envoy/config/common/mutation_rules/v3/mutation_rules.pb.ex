defmodule Envoy.Config.Common.MutationRules.V3.HeaderMutationRules do
  @moduledoc """
  The HeaderMutationRules structure specifies what headers may be
  manipulated by a processing filter. This set of rules makes it
  possible to control which modifications a filter may make.

  By default, an external processing server may add, modify, or remove
  any header except for an "Envoy internal" header (which is typically
  denoted by an x-envoy prefix) or specific headers that may affect
  further filter processing:

  * ``host``
  * ``:authority``
  * ``:scheme``
  * ``:method``

  Every attempt to add, change, append, or remove a header will be
  tested against the rules here. Disallowed header mutations will be
  ignored unless ``disallow_is_error`` is set to true.

  Attempts to remove headers are further constrained -- regardless of the
  settings, system-defined headers (that start with ``:``) and the ``host``
  header may never be removed.

  In addition, a counter will be incremented whenever a mutation is
  rejected. In the ext_proc filter, that counter is named
  ``rejected_header_mutations``.
  [#next-free-field: 8]
  [#protodoc-title: Header mutation rules]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :allow_all_routing, 1, type: Google.Protobuf.BoolValue, json_name: "allowAllRouting"
  field :allow_envoy, 2, type: Google.Protobuf.BoolValue, json_name: "allowEnvoy"
  field :disallow_system, 3, type: Google.Protobuf.BoolValue, json_name: "disallowSystem"
  field :disallow_all, 4, type: Google.Protobuf.BoolValue, json_name: "disallowAll"

  field :allow_expression, 5,
    type: Envoy.Type.Matcher.V3.RegexMatcher,
    json_name: "allowExpression"

  field :disallow_expression, 6,
    type: Envoy.Type.Matcher.V3.RegexMatcher,
    json_name: "disallowExpression"

  field :disallow_is_error, 7, type: Google.Protobuf.BoolValue, json_name: "disallowIsError"
end

defmodule Envoy.Config.Common.MutationRules.V3.HeaderMutation do
  @moduledoc """
  The HeaderMutation structure specifies an action that may be taken on HTTP
  headers.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :action, 0

  field :remove, 1, type: :string, oneof: 0, deprecated: false
  field :append, 2, type: Envoy.Config.Core.V3.HeaderValueOption, oneof: 0
end
