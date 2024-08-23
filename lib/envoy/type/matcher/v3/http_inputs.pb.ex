defmodule Envoy.Type.Matcher.V3.HttpRequestHeaderMatchInput do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpRequestTrailerMatchInput do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpResponseHeaderMatchInput do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpResponseTrailerMatchInput do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpRequestQueryParamMatchInput do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :query_param, 1, type: :string, json_name: "queryParam", deprecated: false
end