defmodule Envoy.Extensions.Filters.Http.Golang.V3alpha.Config.MergePolicy do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :MERGE_VIRTUALHOST_ROUTER_FILTER, 0
  field :MERGE_VIRTUALHOST_ROUTER, 1
  field :OVERRIDE, 3
end

defmodule Envoy.Extensions.Filters.Http.Golang.V3alpha.Config do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :library_id, 1, type: :string, json_name: "libraryId", deprecated: false
  field :library_path, 2, type: :string, json_name: "libraryPath", deprecated: false
  field :plugin_name, 3, type: :string, json_name: "pluginName", deprecated: false
  field :plugin_config, 4, type: Google.Protobuf.Any, json_name: "pluginConfig"

  field :merge_policy, 5,
    type: Envoy.Extensions.Filters.Http.Golang.V3alpha.Config.MergePolicy,
    json_name: "mergePolicy",
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Golang.V3alpha.RouterPlugin do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false
  field :config, 2, type: Google.Protobuf.Any, oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.Golang.V3alpha.ConfigsPerRoute.PluginsConfigEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.Golang.V3alpha.RouterPlugin
end

defmodule Envoy.Extensions.Filters.Http.Golang.V3alpha.ConfigsPerRoute do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :plugins_config, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.Golang.V3alpha.ConfigsPerRoute.PluginsConfigEntry,
    json_name: "pluginsConfig",
    map: true
end