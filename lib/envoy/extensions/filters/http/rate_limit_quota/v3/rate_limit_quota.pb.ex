defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaFilterConfig do
  @moduledoc """
  Configures the Rate Limit Quota filter.

  Can be overridden in the per-route and per-host configurations.
  The more specific definition completely overrides the less specific definition.
  [#next-free-field: 7]
  [#protodoc-title: Rate Limit Quota]
  Rate Limit Quota :ref:`configuration overview <config_http_filters_rate_limit_quota>`.
  [#extension: envoy.filters.http.rate_limit_quota]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rlqs_server, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "rlqsServer",
    deprecated: false

  field :domain, 2, type: :string, deprecated: false

  field :bucket_matchers, 3,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "bucketMatchers",
    deprecated: false

  field :filter_enabled, 4,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled"

  field :filter_enforced, 5,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnforced"

  field :request_headers_to_add_when_not_enforced, 6,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAddWhenNotEnforced",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaOverride do
  @moduledoc """
  Per-route and per-host configuration overrides. The more specific definition completely
  overrides the less specific definition.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :domain, 1, type: :string
  field :bucket_matchers, 2, type: Xds.Type.Matcher.V3.Matcher, json_name: "bucketMatchers"
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.NoAssignmentBehavior do
  @moduledoc """
  Configures the behavior after the first request has been matched to the bucket, and before the
  the RLQS server returns the first quota assignment.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :no_assignment_behavior, 0

  field :fallback_rate_limit, 1,
    type: Envoy.Type.V3.RateLimitStrategy,
    json_name: "fallbackRateLimit",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior.ReuseLastAssignment do
  @moduledoc """
  Reuse the last known quota assignment, effectively extending it for the duration
  specified in the :ref:`expired_assignment_behavior_timeout
  <envoy_v3_api_field_extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior.expired_assignment_behavior_timeout>`
  field.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior do
  @moduledoc """
  Specifies the behavior when the bucket's assignment has expired, and cannot be refreshed for
  any reason.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :expired_assignment_behavior, 0

  field :expired_assignment_behavior_timeout, 1,
    type: Google.Protobuf.Duration,
    json_name: "expiredAssignmentBehaviorTimeout",
    deprecated: false

  field :fallback_rate_limit, 2,
    type: Envoy.Type.V3.RateLimitStrategy,
    json_name: "fallbackRateLimit",
    oneof: 0

  field :reuse_last_assignment, 3,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior.ReuseLastAssignment,
    json_name: "reuseLastAssignment",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.DenyResponseSettings do
  @moduledoc """
  Customize the deny response to the requests over the rate limit.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http_status, 1, type: Envoy.Type.V3.HttpStatus, json_name: "httpStatus"
  field :http_body, 2, type: Google.Protobuf.BytesValue, json_name: "httpBody"
  field :grpc_status, 3, type: Google.Rpc.Status, json_name: "grpcStatus"

  field :response_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder.ValueBuilder do
  @moduledoc """
  Produces the value of the :ref:`BucketId
  <envoy_v3_api_msg_service.rate_limit_quota.v3.BucketId>` map.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :value_specifier, 0

  field :string_value, 1, type: :string, json_name: "stringValue", oneof: 0

  field :custom_value, 2,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "customValue",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder.BucketIdBuilderEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string

  field :value, 2,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder.ValueBuilder
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder do
  @moduledoc """
  ``BucketIdBuilder`` makes it possible to build :ref:`BucketId
  <envoy_v3_api_msg_service.rate_limit_quota.v3.BucketId>` with values substituted
  from the dynamic properties associated with each individual request. See usage examples in
  the docs to :ref:`bucket_id_builder
  <envoy_v3_api_field_extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.bucket_id_builder>`
  field.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :bucket_id_builder, 1,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder.BucketIdBuilderEntry,
    json_name: "bucketIdBuilder",
    map: true,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings do
  @moduledoc """
  Rate Limit Quota Bucket Settings to apply on the successful ``bucket_matchers`` match.

  Specify this message in the :ref:`Matcher.OnMatch.action
  <envoy_v3_api_field_.xds.type.matcher.v3.Matcher.OnMatch.action>` field of the
  ``bucket_matchers`` matcher tree to assign the matched requests to the Quota Bucket.
  Usage example: :ref:`RateLimitQuotaFilterConfig.bucket_matchers
  <envoy_v3_api_field_extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaFilterConfig.bucket_matchers>`.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :bucket_id_builder, 1,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.BucketIdBuilder,
    json_name: "bucketIdBuilder"

  field :reporting_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "reportingInterval",
    deprecated: false

  field :deny_response_settings, 3,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.DenyResponseSettings,
    json_name: "denyResponseSettings"

  field :no_assignment_behavior, 4,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.NoAssignmentBehavior,
    json_name: "noAssignmentBehavior"

  field :expired_assignment_behavior, 5,
    type:
      Envoy.Extensions.Filters.Http.RateLimitQuota.V3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior,
    json_name: "expiredAssignmentBehavior"
end
