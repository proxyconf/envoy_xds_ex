defmodule Envoy.Type.V3.Int64Range do
  @moduledoc """
  Specifies the int64 start and end of the range using half-open interval semantics [start,
  end).
  [#protodoc-title: Range]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :start, 1, type: :int64
  field :end, 2, type: :int64
end

defmodule Envoy.Type.V3.Int32Range do
  @moduledoc """
  Specifies the int32 start and end of the range using half-open interval semantics [start,
  end).
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :start, 1, type: :int32
  field :end, 2, type: :int32
end

defmodule Envoy.Type.V3.DoubleRange do
  @moduledoc """
  Specifies the double start and end of the range using half-open interval semantics [start,
  end).
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :start, 1, type: :double
  field :end, 2, type: :double
end
