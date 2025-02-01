defmodule Envoy.Extensions.Watchdog.ProfileAction.V3.ProfileActionConfig do
  @moduledoc """
  Configuration for the profile watchdog action.
  [#protodoc-title: Watchdog Action that does CPU profiling.]
  [#extension: envoy.watchdog.profile_action]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :profile_duration, 1, type: Google.Protobuf.Duration, json_name: "profileDuration"
  field :profile_path, 2, type: :string, json_name: "profilePath", deprecated: false
  field :max_profiles, 3, type: :uint64, json_name: "maxProfiles"
end
