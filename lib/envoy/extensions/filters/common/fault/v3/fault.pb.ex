defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay.FaultDelayType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :FIXED, 0
end

defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay.HeaderDelay do
  @moduledoc """
  Fault delays are controlled via an HTTP header (if applicable). See the
  :ref:`HTTP fault filter <config_http_filters_fault_injection_http_header>` documentation for
  more information.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay do
  @moduledoc """
  Delay specification is used to inject latency into the
  HTTP/Mongo operation.
  [#next-free-field: 6]
  [#protodoc-title: Common fault injection types]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :fault_delay_secifier, 0

  field :fixed_delay, 3,
    type: Google.Protobuf.Duration,
    json_name: "fixedDelay",
    oneof: 0,
    deprecated: false

  field :header_delay, 5,
    type: Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay.HeaderDelay,
    json_name: "headerDelay",
    oneof: 0

  field :percentage, 4, type: Envoy.Type.V3.FractionalPercent
end

defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit.FixedLimit do
  @moduledoc """
  Describes a fixed/constant rate limit.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :limit_kbps, 1, type: :uint64, json_name: "limitKbps", deprecated: false
end

defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit.HeaderLimit do
  @moduledoc """
  Rate limits are controlled via an HTTP header (if applicable). See the
  :ref:`HTTP fault filter <config_http_filters_fault_injection_http_header>` documentation for
  more information.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit do
  @moduledoc """
  Describes a rate limit to be applied.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :limit_type, 0

  field :fixed_limit, 1,
    type: Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit.FixedLimit,
    json_name: "fixedLimit",
    oneof: 0

  field :header_limit, 3,
    type: Envoy.Extensions.Filters.Common.Fault.V3.FaultRateLimit.HeaderLimit,
    json_name: "headerLimit",
    oneof: 0

  field :percentage, 2, type: Envoy.Type.V3.FractionalPercent
end
