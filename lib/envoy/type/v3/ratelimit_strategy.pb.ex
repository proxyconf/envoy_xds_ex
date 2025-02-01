defmodule Envoy.Type.V3.RateLimitStrategy.BlanketRule do
  @moduledoc """
  Choose between allow all and deny all.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ALLOW_ALL, 0
  field :DENY_ALL, 1
end

defmodule Envoy.Type.V3.RateLimitStrategy.RequestsPerTimeUnit do
  @moduledoc """
  Best-effort limit of the number of requests per time unit.

  Allows to specify the desired requests per second (RPS, QPS), requests per minute (QPM, RPM),
  etc., without specifying a rate limiting algorithm implementation.

  ``RequestsPerTimeUnit`` strategy does not demand any specific rate limiting algorithm to be
  used (in contrast to the :ref:`TokenBucket <envoy_v3_api_msg_type.v3.TokenBucket>`,
  for example). It implies that the implementation details of rate limiting algorithm are
  irrelevant as long as the configured number of "requests per time unit" is achieved.

  Note that the ``TokenBucket`` is still a valid implementation of the ``RequestsPerTimeUnit``
  strategy, and may be chosen to enforce the rate limit. However, there's no guarantee it will be
  the ``TokenBucket`` in particular, and not the Leaky Bucket, the Sliding Window, or any other
  rate limiting algorithm that fulfills the requirements.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :requests_per_time_unit, 1, type: :uint64, json_name: "requestsPerTimeUnit"

  field :time_unit, 2,
    type: Envoy.Type.V3.RateLimitUnit,
    json_name: "timeUnit",
    enum: true,
    deprecated: false
end

defmodule Envoy.Type.V3.RateLimitStrategy do
  @moduledoc """
  [#protodoc-title: Rate Limit Strategies]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :strategy, 0

  field :blanket_rule, 1,
    type: Envoy.Type.V3.RateLimitStrategy.BlanketRule,
    json_name: "blanketRule",
    enum: true,
    oneof: 0,
    deprecated: false

  field :requests_per_time_unit, 2,
    type: Envoy.Type.V3.RateLimitStrategy.RequestsPerTimeUnit,
    json_name: "requestsPerTimeUnit",
    oneof: 0

  field :token_bucket, 3, type: Envoy.Type.V3.TokenBucket, json_name: "tokenBucket", oneof: 0
end
