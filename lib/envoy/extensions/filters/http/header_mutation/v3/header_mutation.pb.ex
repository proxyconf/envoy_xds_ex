defmodule Envoy.Extensions.Filters.Http.HeaderMutation.V3.Mutations do
  @moduledoc """
  [#protodoc-title: Header mutation filter configuration]
  [#extension: envoy.filters.http.header_mutation]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_mutations, 1,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    json_name: "requestMutations"

  field :query_parameter_mutations, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.KeyValueMutation,
    json_name: "queryParameterMutations"

  field :response_mutations, 2,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    json_name: "responseMutations"
end

defmodule Envoy.Extensions.Filters.Http.HeaderMutation.V3.HeaderMutationPerRoute do
  @moduledoc """
  Per route configuration for the header mutation filter.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :mutations, 1, type: Envoy.Extensions.Filters.Http.HeaderMutation.V3.Mutations
end

defmodule Envoy.Extensions.Filters.Http.HeaderMutation.V3.HeaderMutation do
  @moduledoc """
  Configuration for the header mutation filter. The mutation rules in the filter configuration will
  always be applied first and then the per-route mutation rules, if both are specified.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :mutations, 1, type: Envoy.Extensions.Filters.Http.HeaderMutation.V3.Mutations

  field :most_specific_header_mutations_wins, 2,
    type: :bool,
    json_name: "mostSpecificHeaderMutationsWins"
end
