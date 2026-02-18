defmodule Envoy.Extensions.Filters.Http.HeaderMutation.V3.Mutations do
  @moduledoc """
  [#next-free-field: 6]
  [#protodoc-title: Header mutation filter configuration]
  Mutate HTTP headers and trailers in requests and responses.
  [#extension: envoy.filters.http.header_mutation]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.header_mutation.v3.Mutations",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

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

  field :response_trailers_mutations, 4,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    json_name: "responseTrailersMutations"

  field :request_trailers_mutations, 5,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    json_name: "requestTrailersMutations"
end

defmodule Envoy.Extensions.Filters.Http.HeaderMutation.V3.HeaderMutationPerRoute do
  @moduledoc """
  Per route configuration for the header mutation filter.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.header_mutation.v3.HeaderMutationPerRoute",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :mutations, 1, type: Envoy.Extensions.Filters.Http.HeaderMutation.V3.Mutations
end

defmodule Envoy.Extensions.Filters.Http.HeaderMutation.V3.HeaderMutation do
  @moduledoc """
  Configuration for the header mutation filter. The mutation rules in the filter configuration will
  always be applied first and then the per-route mutation rules, if both are specified.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.header_mutation.v3.HeaderMutation",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :mutations, 1, type: Envoy.Extensions.Filters.Http.HeaderMutation.V3.Mutations

  field :most_specific_header_mutations_wins, 2,
    type: :bool,
    json_name: "mostSpecificHeaderMutationsWins"
end
