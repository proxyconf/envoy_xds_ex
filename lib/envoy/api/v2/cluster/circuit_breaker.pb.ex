defmodule Envoy.Api.V2.Cluster.CircuitBreakers.Thresholds.RetryBudget do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :budget_percent, 1, type: Envoy.Type.Percent, json_name: "budgetPercent"

  field :min_retry_concurrency, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "minRetryConcurrency"
end

defmodule Envoy.Api.V2.Cluster.CircuitBreakers.Thresholds do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :priority, 1, type: Envoy.Api.V2.Core.RoutingPriority, enum: true, deprecated: false
  field :max_connections, 2, type: Google.Protobuf.UInt32Value, json_name: "maxConnections"

  field :max_pending_requests, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxPendingRequests"

  field :max_requests, 4, type: Google.Protobuf.UInt32Value, json_name: "maxRequests"
  field :max_retries, 5, type: Google.Protobuf.UInt32Value, json_name: "maxRetries"

  field :retry_budget, 8,
    type: Envoy.Api.V2.Cluster.CircuitBreakers.Thresholds.RetryBudget,
    json_name: "retryBudget"

  field :track_remaining, 6, type: :bool, json_name: "trackRemaining"

  field :max_connection_pools, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectionPools"
end

defmodule Envoy.Api.V2.Cluster.CircuitBreakers do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :thresholds, 1, repeated: true, type: Envoy.Api.V2.Cluster.CircuitBreakers.Thresholds
end