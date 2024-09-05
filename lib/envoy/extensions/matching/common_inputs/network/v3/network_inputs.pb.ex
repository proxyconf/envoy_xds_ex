defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DestinationIPInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DestinationPortInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.SourceIPInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.SourcePortInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DirectSourceIPInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.SourceTypeInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.ServerNameInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.TransportProtocolInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.ApplicationProtocolInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.FilterStateInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DynamicMetadataInput.PathSegment do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DynamicMetadataInput do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :filter, 1, type: :string, deprecated: false

  field :path, 2,
    repeated: true,
    type: Envoy.Extensions.Matching.CommonInputs.Network.V3.DynamicMetadataInput.PathSegment,
    deprecated: false
end