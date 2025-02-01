defmodule Envoy.Admin.V3.ConfigDump do
  @moduledoc """
  The :ref:`/config_dump <operations_admin_interface_config_dump>` admin endpoint uses this wrapper
  message to maintain and serve arbitrary configuration information from any component in Envoy.
  [#protodoc-title: ConfigDump]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :configs, 1, repeated: true, type: Google.Protobuf.Any
end

defmodule Envoy.Admin.V3.BootstrapConfigDump do
  @moduledoc """
  This message describes the bootstrap configuration that Envoy was started with. This includes
  any CLI overrides that were merged. Bootstrap configuration information can be used to recreate
  the static portions of an Envoy configuration by reusing the output as the bootstrap
  configuration for another Envoy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :bootstrap, 1, type: Envoy.Config.Bootstrap.V3.Bootstrap
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.SecretsConfigDump.DynamicSecret do
  @moduledoc """
  DynamicSecret contains secret information fetched via SDS.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :version_info, 2, type: :string, json_name: "versionInfo"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :secret, 4, type: Google.Protobuf.Any
  field :error_state, 5, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 6,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.SecretsConfigDump.StaticSecret do
  @moduledoc """
  StaticSecret specifies statically loaded secret in bootstrap.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :secret, 3, type: Google.Protobuf.Any
end

defmodule Envoy.Admin.V3.SecretsConfigDump do
  @moduledoc """
  Envoys SDS implementation fills this message with all secrets fetched dynamically via SDS.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :static_secrets, 1,
    repeated: true,
    type: Envoy.Admin.V3.SecretsConfigDump.StaticSecret,
    json_name: "staticSecrets"

  field :dynamic_active_secrets, 2,
    repeated: true,
    type: Envoy.Admin.V3.SecretsConfigDump.DynamicSecret,
    json_name: "dynamicActiveSecrets"

  field :dynamic_warming_secrets, 3,
    repeated: true,
    type: Envoy.Admin.V3.SecretsConfigDump.DynamicSecret,
    json_name: "dynamicWarmingSecrets"
end
