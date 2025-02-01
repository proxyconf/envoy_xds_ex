defmodule Envoy.Type.V3.RateLimitUnit do
  @moduledoc """
  Identifies the unit of of time for rate limit.
  [#protodoc-title: Ratelimit Time Unit]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :SECOND, 1
  field :MINUTE, 2
  field :HOUR, 3
  field :DAY, 4
  field :MONTH, 5
  field :YEAR, 6
end
