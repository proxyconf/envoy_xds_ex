defmodule Envoy.Admin.V3.UnreadyTargetsDumps.UnreadyTargetsDump do
  @moduledoc """
  Message of unready targets information of an init manager.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :target_names, 2, repeated: true, type: :string, json_name: "targetNames"
end

defmodule Envoy.Admin.V3.UnreadyTargetsDumps do
  @moduledoc """
  Dumps of unready targets of envoy init managers. Envoy's admin fills this message with init managers,
  which provides the information of their unready targets.
  The :ref:`/init_dump <operations_admin_interface_init_dump>` will dump all unready targets information.
  [#protodoc-title: InitDump]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :unready_targets_dumps, 1,
    repeated: true,
    type: Envoy.Admin.V3.UnreadyTargetsDumps.UnreadyTargetsDump,
    json_name: "unreadyTargetsDumps"
end
