defmodule Envoy.Type.V3.RateLimitUnit do
  @moduledoc """
  Identifies the unit of of time for rate limit.
  [#protodoc-title: Ratelimit Time Unit]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.type.v3.RateLimitUnit",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNKNOWN, 0
  field :SECOND, 1
  field :MINUTE, 2
  field :HOUR, 3
  field :DAY, 4
  field :MONTH, 5
  field :YEAR, 6
end
