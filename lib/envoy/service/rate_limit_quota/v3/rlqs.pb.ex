defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaUsageReports.BucketQuotaUsage do
  @moduledoc """
  The usage report for a bucket.

  .. note::
  Note that the first report sent for a ``BucketId`` indicates to the RLQS server that
  the RLQS client is subscribing for the future assignments for this ``BucketId``.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :bucket_id, 1,
    type: Envoy.Service.RateLimitQuota.V3.BucketId,
    json_name: "bucketId",
    deprecated: false

  field :time_elapsed, 2,
    type: Google.Protobuf.Duration,
    json_name: "timeElapsed",
    deprecated: false

  field :num_requests_allowed, 3, type: :uint64, json_name: "numRequestsAllowed"
  field :num_requests_denied, 4, type: :uint64, json_name: "numRequestsDenied"
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaUsageReports do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :domain, 1, type: :string, deprecated: false

  field :bucket_quota_usages, 2,
    repeated: true,
    type: Envoy.Service.RateLimitQuota.V3.RateLimitQuotaUsageReports.BucketQuotaUsage,
    json_name: "bucketQuotaUsages",
    deprecated: false
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction.QuotaAssignmentAction do
  @moduledoc """
  Quota assignment for the bucket. Configures the rate limiting strategy and the duration
  for the given :ref:`bucket_id
  <envoy_v3_api_field_service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.bucket_id>`.

  **Applying the first assignment to the bucket**

  Once the data plane receives the ``QuotaAssignmentAction``, it must send the current usage
  report for the bucket, and start rate limiting requests matched into the bucket
  using the strategy configured in the :ref:`rate_limit_strategy
  <envoy_v3_api_field_service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.QuotaAssignmentAction.rate_limit_strategy>`
  field. The assignment becomes bucket's ``active`` assignment.

  **Expiring the assignment**

  The duration of the assignment defined in the :ref:`assignment_time_to_live
  <envoy_v3_api_field_service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.QuotaAssignmentAction.assignment_time_to_live>`
  field. When the duration runs off, the assignment is ``expired``, and no longer ``active``.
  The data plane should stop applying the rate limiting strategy to the bucket, and transition
  the bucket to the "expired assignment" state. This activates the behavior configured in the
  :ref:`expired_assignment_behavior <envoy_v3_api_field_extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.expired_assignment_behavior>`
  field.

  **Replacing the assignment**

  * If the rate limiting strategy is different from bucket's ``active`` assignment, or
  the current bucket assignment is ``expired``, the data plane must immediately
  end the current assignment, report the bucket usage, and apply the new assignment.
  The new assignment becomes bucket's ``active`` assignment.
  * If the rate limiting strategy is the same as the bucket's ``active`` (not ``expired``)
  assignment, the data plane should extend the duration of the ``active`` assignment
  for the duration of the new assignment provided in the :ref:`assignment_time_to_live
  <envoy_v3_api_field_service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.QuotaAssignmentAction.assignment_time_to_live>`
  field. The ``active`` assignment is considered unchanged.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :assignment_time_to_live, 2,
    type: Google.Protobuf.Duration,
    json_name: "assignmentTimeToLive",
    deprecated: false

  field :rate_limit_strategy, 3,
    type: Envoy.Type.V3.RateLimitStrategy,
    json_name: "rateLimitStrategy"
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction.AbandonAction do
  @moduledoc """
  Abandon action for the bucket. Indicates that the RLQS server will no longer be
  sending updates for the given :ref:`bucket_id
  <envoy_v3_api_field_service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.bucket_id>`.

  If no requests are reported for a bucket, after some time the server considers the bucket
  inactive. The server stops tracking the bucket, and instructs the the data plane to abandon
  the bucket via this message.

  **Abandoning the assignment**

  The data plane is to erase the bucket (including its usage data) from the memory.
  It should stop tracking the bucket, and stop reporting its usage. This effectively resets
  the data plane to the state prior to matching the first request into the bucket.

  **Restarting the subscription**

  If a new request is matched into a bucket previously abandoned, the data plane must behave
  as if it has never tracked the bucket, and it's the first request matched into it:

  1. The process of :ref:`subscription and reporting
  <envoy_v3_api_field_extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.reporting_interval>`
  starts from the beginning.

  2. The bucket transitions to the :ref:`"no assignment"
  <envoy_v3_api_field_extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.no_assignment_behavior>`
  state.

  3. Once the new assignment is received, it's applied per
  "Applying the first assignment to the bucket" section of the :ref:`QuotaAssignmentAction
  <envoy_v3_api_msg_service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.QuotaAssignmentAction>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction do
  @moduledoc """
  Commands the data plane to apply one of the actions to the bucket with the
  :ref:`bucket_id <envoy_v3_api_field_service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.bucket_id>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :bucket_action, 0

  field :bucket_id, 1,
    type: Envoy.Service.RateLimitQuota.V3.BucketId,
    json_name: "bucketId",
    deprecated: false

  field :quota_assignment_action, 2,
    type:
      Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction.QuotaAssignmentAction,
    json_name: "quotaAssignmentAction",
    oneof: 0

  field :abandon_action, 3,
    type: Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction.AbandonAction,
    json_name: "abandonAction",
    oneof: 0
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :bucket_action, 1,
    repeated: true,
    type: Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse.BucketAction,
    json_name: "bucketAction",
    deprecated: false
end

defmodule Envoy.Service.RateLimitQuota.V3.BucketId.BucketEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.RateLimitQuota.V3.BucketId do
  @moduledoc """
  The identifier for the bucket. Used to match the bucket between the control plane (RLQS server),
  and the data plane (RLQS client), f.e.:

  * the data plane sends a usage report for requests matched into the bucket with ``BucketId``
  to the control plane
  * the control plane sends an assignment for the bucket with ``BucketId`` to the data plane
  Bucket ID.

  Example:

  .. validated-code-block:: yaml
  :type-name: envoy.service.rate_limit_quota.v3.BucketId

  bucket:
  name: my_bucket
  env: staging

  .. note::
  The order of ``BucketId`` keys do not matter. Buckets ``{ a: 'A', b: 'B' }`` and
  ``{ b: 'B', a: 'A' }`` are identical.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :bucket, 1,
    repeated: true,
    type: Envoy.Service.RateLimitQuota.V3.BucketId.BucketEntry,
    map: true,
    deprecated: false
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaService.Service do
  @moduledoc """
  Defines the Rate Limit Quota Service (RLQS).
  [#protodoc-title: Rate Limit Quota Service (RLQS)]
  The Rate Limit Quota Service (RLQS) is a Envoy global rate limiting service that allows to
  delegate rate limit decisions to a remote service. The service will aggregate the usage reports
  from multiple data plane instances, and distribute Rate Limit Assignments to each instance
  based on its business logic. The logic is outside of the scope of the protocol API.

  The protocol is designed as a streaming-first API. It utilizes watch-like subscription model.
  The data plane groups requests into Quota Buckets as directed by the filter config,
  and periodically reports them to the RLQS server along with the Bucket identifier, :ref:`BucketId
  <envoy_v3_api_msg_service.rate_limit_quota.v3.BucketId>`. Once RLQS server has collected enough
  reports to make a decision, it'll send back the assignment with the rate limiting instructions.

  The first report sent by the data plane is interpreted by the RLQS server as a "watch" request,
  indicating that the data plane instance is interested in receiving further updates for the
  ``BucketId``. From then on, RLQS server may push assignments to this instance at will, even if
  the instance is not sending usage reports. It's the responsibility of the RLQS server
  to determine when the data plane instance didn't send ``BucketId`` reports for too long,
  and to respond with the :ref:`AbandonAction
  <envoy_v3_api_msg_service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.AbandonAction>`,
  indicating that the server has now stopped sending quota assignments for the ``BucketId`` bucket,
  and the data plane instance should :ref:`abandon
  <envoy_v3_api_field_service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.abandon_action>`
  it.

  If for any reason the RLQS client doesn't receive the initial assignment for the reported bucket,
  in order to prevent memory exhaustion, the data plane will limit the time such bucket
  is retained. The exact time to wait for the initial assignment is chosen by the filter,
  and may vary based on the implementation.
  Once the duration ends, the data plane will stop reporting bucket usage, reject any enqueued
  requests, and purge the bucket from the memory. Subsequent requests matched into the bucket
  will re-initialize the bucket in the "no assignment" state, restarting the reports.

  Refer to Rate Limit Quota :ref:`configuration overview <config_http_filters_rate_limit_quota>`
  for further details.
  """

  use GRPC.Service,
    name: "envoy.service.rate_limit_quota.v3.RateLimitQuotaService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamRateLimitQuotas,
      stream(Envoy.Service.RateLimitQuota.V3.RateLimitQuotaUsageReports),
      stream(Envoy.Service.RateLimitQuota.V3.RateLimitQuotaResponse)
end

defmodule Envoy.Service.RateLimitQuota.V3.RateLimitQuotaService.Stub do
  use GRPC.Stub, service: Envoy.Service.RateLimitQuota.V3.RateLimitQuotaService.Service
end
