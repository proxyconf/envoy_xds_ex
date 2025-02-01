defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.TimerType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSPECIFIED, 0
  field :HTTP_DOWNSTREAM_CONNECTION_IDLE, 1
  field :HTTP_DOWNSTREAM_STREAM_IDLE, 2
  field :TRANSPORT_SOCKET_CONNECT, 3
  field :HTTP_DOWNSTREAM_CONNECTION_MAX, 4
end

defmodule Envoy.Config.Overload.V3.ResourceMonitor do
  @moduledoc """
  [#protodoc-title: Overload Manager]
  The Overload Manager provides an extensible framework to protect Envoy instances
  from overload of various resources (memory, cpu, file descriptors, etc).
  It monitors a configurable set of resources and notifies registered listeners
  when triggers related to those resources fire.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Overload.V3.ThresholdTrigger do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :value, 1, type: :double, deprecated: false
end

defmodule Envoy.Config.Overload.V3.ScaledTrigger do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :scaling_threshold, 1, type: :double, json_name: "scalingThreshold", deprecated: false

  field :saturation_threshold, 2,
    type: :double,
    json_name: "saturationThreshold",
    deprecated: false
end

defmodule Envoy.Config.Overload.V3.Trigger do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :trigger_oneof, 0

  field :name, 1, type: :string, deprecated: false
  field :threshold, 2, type: Envoy.Config.Overload.V3.ThresholdTrigger, oneof: 0
  field :scaled, 3, type: Envoy.Config.Overload.V3.ScaledTrigger, oneof: 0
end

defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.ScaleTimer do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :overload_adjust, 0

  field :timer, 1,
    type: Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.TimerType,
    enum: true,
    deprecated: false

  field :min_timeout, 2, type: Google.Protobuf.Duration, json_name: "minTimeout", oneof: 0
  field :min_scale, 3, type: Envoy.Type.V3.Percent, json_name: "minScale", oneof: 0
end

defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig do
  @moduledoc """
  Typed configuration for the "envoy.overload_actions.reduce_timeouts" action. See
  :ref:`the docs <config_overload_manager_reducing_timeouts>` for an example of how to configure
  the action with different timeouts and minimum values.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :timer_scale_factors, 1,
    repeated: true,
    type: Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.ScaleTimer,
    json_name: "timerScaleFactors",
    deprecated: false
end

defmodule Envoy.Config.Overload.V3.OverloadAction do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :triggers, 2, repeated: true, type: Envoy.Config.Overload.V3.Trigger, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig"
end

defmodule Envoy.Config.Overload.V3.LoadShedPoint do
  @moduledoc """
  A point within the connection or request lifecycle that provides context on
  whether to shed load at that given stage for the current entity at the
  point.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :triggers, 2, repeated: true, type: Envoy.Config.Overload.V3.Trigger, deprecated: false
end

defmodule Envoy.Config.Overload.V3.BufferFactoryConfig do
  @moduledoc """
  Configuration for which accounts the WatermarkBuffer Factories should
  track.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :minimum_account_to_track_power_of_two, 1,
    type: :uint32,
    json_name: "minimumAccountToTrackPowerOfTwo",
    deprecated: false
end

defmodule Envoy.Config.Overload.V3.OverloadManager do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :refresh_interval, 1, type: Google.Protobuf.Duration, json_name: "refreshInterval"

  field :resource_monitors, 2,
    repeated: true,
    type: Envoy.Config.Overload.V3.ResourceMonitor,
    json_name: "resourceMonitors",
    deprecated: false

  field :actions, 3, repeated: true, type: Envoy.Config.Overload.V3.OverloadAction

  field :loadshed_points, 5,
    repeated: true,
    type: Envoy.Config.Overload.V3.LoadShedPoint,
    json_name: "loadshedPoints"

  field :buffer_factory_config, 4,
    type: Envoy.Config.Overload.V3.BufferFactoryConfig,
    json_name: "bufferFactoryConfig"
end
