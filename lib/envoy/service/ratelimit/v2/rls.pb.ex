defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.Code do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :OK, 1
  field :OVER_LIMIT, 2
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit.Unit do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :SECOND, 1
  field :MINUTE, 2
  field :HOUR, 3
  field :DAY, 4
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitRequest do
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
  field :descriptors, 2, repeated: true, type: Envoy.Api.V2.Ratelimit.RateLimitDescriptor
  field :hits_addend, 3, type: :uint32, json_name: "hitsAddend"
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit do
  @moduledoc """
  Defines an actual rate limit in terms of requests per unit of time and the unit itself.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 3, type: :string
  field :requests_per_unit, 1, type: :uint32, json_name: "requestsPerUnit"
  field :unit, 2, type: Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit.Unit, enum: true
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.DescriptorStatus do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :code, 1, type: Envoy.Service.Ratelimit.V2.RateLimitResponse.Code, enum: true

  field :current_limit, 2,
    type: Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit,
    json_name: "currentLimit"

  field :limit_remaining, 3, type: :uint32, json_name: "limitRemaining"
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse do
  @moduledoc """
  A response from a ShouldRateLimit call.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :overall_code, 1,
    type: Envoy.Service.Ratelimit.V2.RateLimitResponse.Code,
    json_name: "overallCode",
    enum: true

  field :statuses, 2,
    repeated: true,
    type: Envoy.Service.Ratelimit.V2.RateLimitResponse.DescriptorStatus

  field :headers, 3, repeated: true, type: Envoy.Api.V2.Core.HeaderValue, deprecated: false

  field :request_headers_to_add, 4,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValue,
    json_name: "requestHeadersToAdd"
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitService.Service do
  @moduledoc """
  [#protodoc-title: Rate Limit Service (RLS)]
  """

  use GRPC.Service,
    name: "envoy.service.ratelimit.v2.RateLimitService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :ShouldRateLimit,
      Envoy.Service.Ratelimit.V2.RateLimitRequest,
      Envoy.Service.Ratelimit.V2.RateLimitResponse
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitService.Stub do
  use GRPC.Stub, service: Envoy.Service.Ratelimit.V2.RateLimitService.Service
end
