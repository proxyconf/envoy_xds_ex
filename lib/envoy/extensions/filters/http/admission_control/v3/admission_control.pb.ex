defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria.HttpCriteria do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http_success_status, 1,
    repeated: true,
    type: Envoy.Type.V3.Int32Range,
    json_name: "httpSuccessStatus",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria.GrpcCriteria do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :grpc_success_status, 1,
    repeated: true,
    type: :uint32,
    json_name: "grpcSuccessStatus",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria do
  @moduledoc """
  Default method of specifying what constitutes a successful request. All status codes that
  indicate a successful request must be explicitly specified if not relying on the default
  values.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http_criteria, 1,
    type:
      Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria.HttpCriteria,
    json_name: "httpCriteria"

  field :grpc_criteria, 2,
    type:
      Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria.GrpcCriteria,
    json_name: "grpcCriteria"
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl do
  @moduledoc """
  [#next-free-field: 8]
  [#protodoc-title: Admission Control]
  [#extension: envoy.filters.http.admission_control]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :evaluation_criteria, 0

  field :enabled, 1, type: Envoy.Config.Core.V3.RuntimeFeatureFlag

  field :success_criteria, 2,
    type: Envoy.Extensions.Filters.Http.AdmissionControl.V3.AdmissionControl.SuccessCriteria,
    json_name: "successCriteria",
    oneof: 0

  field :sampling_window, 3, type: Google.Protobuf.Duration, json_name: "samplingWindow"
  field :aggression, 4, type: Envoy.Config.Core.V3.RuntimeDouble
  field :sr_threshold, 5, type: Envoy.Config.Core.V3.RuntimePercent, json_name: "srThreshold"
  field :rps_threshold, 6, type: Envoy.Config.Core.V3.RuntimeUInt32, json_name: "rpsThreshold"

  field :max_rejection_probability, 7,
    type: Envoy.Config.Core.V3.RuntimePercent,
    json_name: "maxRejectionProbability"
end
