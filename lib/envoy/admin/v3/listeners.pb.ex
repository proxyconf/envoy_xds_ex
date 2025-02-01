defmodule Envoy.Admin.V3.Listeners do
  @moduledoc """
  Admin endpoint uses this wrapper for ``/listeners`` to display listener status information.
  See :ref:`/listeners <operations_admin_interface_listeners>` for more information.
  [#protodoc-title: Listeners]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :listener_statuses, 1,
    repeated: true,
    type: Envoy.Admin.V3.ListenerStatus,
    json_name: "listenerStatuses"
end

defmodule Envoy.Admin.V3.ListenerStatus do
  @moduledoc """
  Details an individual listener's current status.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :local_address, 2, type: Envoy.Config.Core.V3.Address, json_name: "localAddress"

  field :additional_local_addresses, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.Address,
    json_name: "additionalLocalAddresses"
end
