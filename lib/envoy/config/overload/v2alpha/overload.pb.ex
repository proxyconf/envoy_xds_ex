defmodule Envoy.Config.Overload.V2alpha.ResourceMonitor do
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
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Overload.V2alpha.ThresholdTrigger do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :value, 1, type: :double, deprecated: false
end

defmodule Envoy.Config.Overload.V2alpha.Trigger do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :trigger_oneof, 0

  field :name, 1, type: :string, deprecated: false
  field :threshold, 2, type: Envoy.Config.Overload.V2alpha.ThresholdTrigger, oneof: 0
end

defmodule Envoy.Config.Overload.V2alpha.OverloadAction do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :triggers, 2,
    repeated: true,
    type: Envoy.Config.Overload.V2alpha.Trigger,
    deprecated: false
end

defmodule Envoy.Config.Overload.V2alpha.OverloadManager do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :refresh_interval, 1, type: Google.Protobuf.Duration, json_name: "refreshInterval"

  field :resource_monitors, 2,
    repeated: true,
    type: Envoy.Config.Overload.V2alpha.ResourceMonitor,
    json_name: "resourceMonitors",
    deprecated: false

  field :actions, 3, repeated: true, type: Envoy.Config.Overload.V2alpha.OverloadAction
end
