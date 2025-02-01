defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.ServiceMatchInput do
  @moduledoc """
  Used to match request service of the downstream request. Only applicable if a service provided
  by the application protocol.
  This is deprecated and should be replaced by HostMatchInput. This is kept for backward compatibility.
  [#protodoc-title: Generic Proxy Route Matcher Configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.HostMatchInput do
  @moduledoc """
  Used to match request host of the generic downstream request. Only applicable if a host provided
  by the application protocol.
  This is same with the ServiceMatchInput and this should be preferred over ServiceMatchInput.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.PathMatchInput do
  @moduledoc """
  Used to match request path of the generic downstream request. Only applicable if a path provided
  by the application protocol.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.MethodMatchInput do
  @moduledoc """
  Used to match request method of the generic downstream request. Only applicable if a method provided
  by the application protocol.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.PropertyMatchInput do
  @moduledoc """
  Used to match an arbitrary property of the generic downstream request.
  These properties are populated by the codecs of application protocols.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :property_name, 1, type: :string, json_name: "propertyName", deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.RequestMatchInput do
  @moduledoc """
  Used to match an whole generic downstream request.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.KeyValueMatchEntry do
  @moduledoc """
  Used to match an arbitrary key-value pair for headers, trailers or properties.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :string_match, 2,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "stringMatch",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.RequestMatcher do
  @moduledoc """
  Custom matcher to match on the generic downstream request. This is used to match
  multiple fields of the downstream request and avoid complex combinations of
  HostMatchInput, PathMatchInput, MethodMatchInput and PropertyMatchInput.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :host, 1, type: Envoy.Type.Matcher.V3.StringMatcher
  field :path, 2, type: Envoy.Type.Matcher.V3.StringMatcher
  field :method, 3, type: Envoy.Type.Matcher.V3.StringMatcher

  field :properties, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.KeyValueMatchEntry
end
