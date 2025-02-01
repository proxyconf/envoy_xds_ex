defmodule Envoy.Api.V2.Core.SocketAddress.Protocol do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :TCP, 0
  field :UDP, 1
end

defmodule Envoy.Api.V2.Core.Pipe do
  @moduledoc """
  [#protodoc-title: Network addresses]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :path, 1, type: :string, deprecated: false
  field :mode, 2, type: :uint32, deprecated: false
end

defmodule Envoy.Api.V2.Core.SocketAddress do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :port_specifier, 0

  field :protocol, 1,
    type: Envoy.Api.V2.Core.SocketAddress.Protocol,
    enum: true,
    deprecated: false

  field :address, 2, type: :string, deprecated: false
  field :port_value, 3, type: :uint32, json_name: "portValue", oneof: 0, deprecated: false
  field :named_port, 4, type: :string, json_name: "namedPort", oneof: 0
  field :resolver_name, 5, type: :string, json_name: "resolverName"
  field :ipv4_compat, 6, type: :bool, json_name: "ipv4Compat"
end

defmodule Envoy.Api.V2.Core.TcpKeepalive do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :keepalive_probes, 1, type: Google.Protobuf.UInt32Value, json_name: "keepaliveProbes"
  field :keepalive_time, 2, type: Google.Protobuf.UInt32Value, json_name: "keepaliveTime"
  field :keepalive_interval, 3, type: Google.Protobuf.UInt32Value, json_name: "keepaliveInterval"
end

defmodule Envoy.Api.V2.Core.BindConfig do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :source_address, 1,
    type: Envoy.Api.V2.Core.SocketAddress,
    json_name: "sourceAddress",
    deprecated: false

  field :freebind, 2, type: Google.Protobuf.BoolValue

  field :socket_options, 3,
    repeated: true,
    type: Envoy.Api.V2.Core.SocketOption,
    json_name: "socketOptions"
end

defmodule Envoy.Api.V2.Core.Address do
  @moduledoc """
  Addresses specify either a logical or physical address and port, which are
  used to tell Envoy where to bind/listen, connect to upstream and find
  management servers.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :address, 0

  field :socket_address, 1,
    type: Envoy.Api.V2.Core.SocketAddress,
    json_name: "socketAddress",
    oneof: 0

  field :pipe, 2, type: Envoy.Api.V2.Core.Pipe, oneof: 0
end

defmodule Envoy.Api.V2.Core.CidrRange do
  @moduledoc """
  CidrRange specifies an IP Address and a prefix length to construct
  the subnet mask for a `CIDR <https://tools.ietf.org/html/rfc4632>`_ range.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address_prefix, 1, type: :string, json_name: "addressPrefix", deprecated: false

  field :prefix_len, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "prefixLen",
    deprecated: false
end
