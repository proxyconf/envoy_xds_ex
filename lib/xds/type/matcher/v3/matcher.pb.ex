defmodule Xds.Type.Matcher.V3.Matcher.OnMatch do
  @moduledoc """
  What to do if a match is successful.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :on_match, 0

  field :matcher, 1, type: Xds.Type.Matcher.V3.Matcher, oneof: 0
  field :action, 2, type: Xds.Core.V3.TypedExtensionConfig, oneof: 0
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate.SinglePredicate do
  @moduledoc """
  Predicate for a single input field.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :matcher, 0

  field :input, 1, type: Xds.Core.V3.TypedExtensionConfig, deprecated: false

  field :value_match, 2,
    type: Xds.Type.Matcher.V3.StringMatcher,
    json_name: "valueMatch",
    oneof: 0

  field :custom_match, 3,
    type: Xds.Core.V3.TypedExtensionConfig,
    json_name: "customMatch",
    oneof: 0
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate.PredicateList do
  @moduledoc """
  A list of two or more matchers. Used to allow using a list within a oneof.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :predicate, 1,
    repeated: true,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate,
    deprecated: false
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate do
  @moduledoc """
  Predicate to determine if a match is successful.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :match_type, 0

  field :single_predicate, 1,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate.SinglePredicate,
    json_name: "singlePredicate",
    oneof: 0

  field :or_matcher, 2,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate.PredicateList,
    json_name: "orMatcher",
    oneof: 0

  field :and_matcher, 3,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate.PredicateList,
    json_name: "andMatcher",
    oneof: 0

  field :not_matcher, 4,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate,
    json_name: "notMatcher",
    oneof: 0
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherList.FieldMatcher do
  @moduledoc """
  An individual matcher.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :predicate, 1, type: Xds.Type.Matcher.V3.Matcher.MatcherList.Predicate, deprecated: false

  field :on_match, 2,
    type: Xds.Type.Matcher.V3.Matcher.OnMatch,
    json_name: "onMatch",
    deprecated: false
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherList do
  @moduledoc """
  A linear list of field matchers.
  The field matchers are evaluated in order, and the first match
  wins.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :matchers, 1,
    repeated: true,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList.FieldMatcher,
    deprecated: false
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherTree.MatchMap.MapEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Xds.Type.Matcher.V3.Matcher.OnMatch
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherTree.MatchMap do
  @moduledoc """
  A map of configured matchers. Used to allow using a map within a oneof.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :map, 1,
    repeated: true,
    type: Xds.Type.Matcher.V3.Matcher.MatcherTree.MatchMap.MapEntry,
    map: true,
    deprecated: false
end

defmodule Xds.Type.Matcher.V3.Matcher.MatcherTree do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :tree_type, 0

  field :input, 1, type: Xds.Core.V3.TypedExtensionConfig, deprecated: false

  field :exact_match_map, 2,
    type: Xds.Type.Matcher.V3.Matcher.MatcherTree.MatchMap,
    json_name: "exactMatchMap",
    oneof: 0

  field :prefix_match_map, 3,
    type: Xds.Type.Matcher.V3.Matcher.MatcherTree.MatchMap,
    json_name: "prefixMatchMap",
    oneof: 0

  field :custom_match, 4,
    type: Xds.Core.V3.TypedExtensionConfig,
    json_name: "customMatch",
    oneof: 0
end

defmodule Xds.Type.Matcher.V3.Matcher do
  @moduledoc """
  A matcher, which may traverse a matching tree in order to result in a match action.
  During matching, the tree will be traversed until a match is found, or if no match
  is found the action specified by the most specific on_no_match will be evaluated.
  As an on_no_match might result in another matching tree being evaluated, this process
  might repeat several times until the final OnMatch (or no match) is decided.
  [#protodoc-title: Unified Matcher API]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :matcher_type, 0

  field :matcher_list, 1,
    type: Xds.Type.Matcher.V3.Matcher.MatcherList,
    json_name: "matcherList",
    oneof: 0

  field :matcher_tree, 2,
    type: Xds.Type.Matcher.V3.Matcher.MatcherTree,
    json_name: "matcherTree",
    oneof: 0

  field :on_no_match, 3, type: Xds.Type.Matcher.V3.Matcher.OnMatch, json_name: "onNoMatch"
end
