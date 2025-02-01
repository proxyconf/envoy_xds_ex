defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.Code do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :OK, 1
  field :OVER_LIMIT, 2
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit.Unit do
  @moduledoc """
  Identifies the unit of of time for rate limit.
  [#comment: replace by envoy/type/v3/ratelimit_unit.proto in v4]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :SECOND, 1
  field :MINUTE, 2
  field :HOUR, 3
  field :DAY, 4
  field :WEEK, 7
  field :MONTH, 5
  field :YEAR, 6
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitRequest do
  @moduledoc """
  Main message for a rate limit request. The rate limit service is designed to be fully generic
  in the sense that it can operate on arbitrary hierarchical key/value pairs. The loaded
  configuration will parse the request and find the most specific limit to apply. In addition,
  a RateLimitRequest can contain multiple "descriptors" to limit on. When multiple descriptors
  are provided, the server will limit on *ALL* of them and return an OVER_LIMIT response if any
  of them are over limit. This enables more complex application level rate limiting scenarios
  if desired.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :domain, 1, type: :string

  field :descriptors, 2,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor

  field :hits_addend, 3, type: :uint32, json_name: "hitsAddend"
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit do
  @moduledoc """
  Defines an actual rate limit in terms of requests per unit of time and the unit itself.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 3, type: :string
  field :requests_per_unit, 1, type: :uint32, json_name: "requestsPerUnit"
  field :unit, 2, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit.Unit, enum: true
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.Quota do
  @moduledoc """
  Cacheable quota for responses.
  Quota can be granted at different levels: either for each individual descriptor or for the whole descriptor set.
  This is a certain number of requests over a period of time.
  The client may cache this result and apply the effective RateLimitResponse to future matching
  requests without querying rate limit service.

  When quota expires due to timeout, a new RLS request will also be made.
  The implementation may choose to preemptively query the rate limit server for more quota on or
  before expiration or before the available quota runs out.
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :expiration_specifier, 0

  field :requests, 1, type: :uint32, deprecated: false
  field :valid_until, 2, type: Google.Protobuf.Timestamp, json_name: "validUntil", oneof: 0
  field :id, 3, type: :string
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse.DescriptorStatus do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :code, 1, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.Code, enum: true

  field :current_limit, 2,
    type: Envoy.Service.Ratelimit.V3.RateLimitResponse.RateLimit,
    json_name: "currentLimit"

  field :limit_remaining, 3, type: :uint32, json_name: "limitRemaining"
  field :duration_until_reset, 4, type: Google.Protobuf.Duration, json_name: "durationUntilReset"
  field :quota, 5, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.Quota
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitResponse do
  @moduledoc """
  A response from a ShouldRateLimit call.
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :overall_code, 1,
    type: Envoy.Service.Ratelimit.V3.RateLimitResponse.Code,
    json_name: "overallCode",
    enum: true

  field :statuses, 2,
    repeated: true,
    type: Envoy.Service.Ratelimit.V3.RateLimitResponse.DescriptorStatus

  field :response_headers_to_add, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValue,
    json_name: "responseHeadersToAdd"

  field :request_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValue,
    json_name: "requestHeadersToAdd"

  field :raw_body, 5, type: :bytes, json_name: "rawBody"
  field :dynamic_metadata, 6, type: Google.Protobuf.Struct, json_name: "dynamicMetadata"
  field :quota, 7, type: Envoy.Service.Ratelimit.V3.RateLimitResponse.Quota
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitService.Service do
  @moduledoc """
  [#protodoc-title: Rate limit service (RLS)]
  """

  use GRPC.Service,
    name: "envoy.service.ratelimit.v3.RateLimitService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :ShouldRateLimit,
      Envoy.Service.Ratelimit.V3.RateLimitRequest,
      Envoy.Service.Ratelimit.V3.RateLimitResponse
end

defmodule Envoy.Service.Ratelimit.V3.RateLimitService.Stub do
  use GRPC.Stub, service: Envoy.Service.Ratelimit.V3.RateLimitService.Service
end
