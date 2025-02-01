defmodule Envoy.Config.Core.V3.SocketOption.SocketState do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :STATE_PREBIND, 0
  field :STATE_BOUND, 1
  field :STATE_LISTENING, 2
end

defmodule Envoy.Config.Core.V3.SocketOption.SocketType.Stream do
  @moduledoc """
  The stream socket type.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Core.V3.SocketOption.SocketType.Datagram do
  @moduledoc """
  The datagram socket type.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Core.V3.SocketOption.SocketType do
  @moduledoc """
  The `socket type <https://linux.die.net/man/2/socket>`_ to apply the socket option to.
  Only one field should be set. If multiple fields are set, the precedence order will determine
  the selected one. If none of the fields is set, the socket option will be applied to all socket types.

  For example:
  If :ref:`stream <envoy_v3_api_field_config.core.v3.SocketOption.SocketType.stream>` is set,
  it takes precedence over :ref:`datagram <envoy_v3_api_field_config.core.v3.SocketOption.SocketType.datagram>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stream, 1, type: Envoy.Config.Core.V3.SocketOption.SocketType.Stream
  field :datagram, 2, type: Envoy.Config.Core.V3.SocketOption.SocketType.Datagram
end

defmodule Envoy.Config.Core.V3.SocketOption do
  @moduledoc """
  Generic socket option message. This would be used to set socket options that
  might not exist in upstream kernels or precompiled Envoy binaries.

  For example:

  .. code-block:: json

  {
  "description": "support tcp keep alive",
  "state": 0,
  "level": 1,
  "name": 9,
  "int_value": 1,
  }

  1 means SOL_SOCKET and 9 means SO_KEEPALIVE on Linux.
  With the above configuration, `TCP Keep-Alives <https://www.freesoft.org/CIE/RFC/1122/114.htm>`_
  can be enabled in socket with Linux, which can be used in
  :ref:`listener's<envoy_v3_api_field_config.listener.v3.Listener.socket_options>` or
  :ref:`admin's <envoy_v3_api_field_config.bootstrap.v3.Admin.socket_options>` socket_options etc.

  It should be noted that the name or level may have different values on different platforms.
  [#next-free-field: 8]
  [#protodoc-title: Socket option]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :value, 0

  field :description, 1, type: :string
  field :level, 2, type: :int64
  field :name, 3, type: :int64
  field :int_value, 4, type: :int64, json_name: "intValue", oneof: 0
  field :buf_value, 5, type: :bytes, json_name: "bufValue", oneof: 0

  field :state, 6,
    type: Envoy.Config.Core.V3.SocketOption.SocketState,
    enum: true,
    deprecated: false

  field :type, 7, type: Envoy.Config.Core.V3.SocketOption.SocketType
end

defmodule Envoy.Config.Core.V3.SocketOptionsOverride do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :socket_options, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketOption,
    json_name: "socketOptions"
end
