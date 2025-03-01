defmodule Envoy.Extensions.Retry.Priority.PreviousPriorities.V3.PreviousPrioritiesConfig do
  @moduledoc """
  A retry host selector that attempts to spread retries between priorities, even if certain
  priorities would not normally be attempted due to higher priorities being available.

  As priorities get excluded, load will be distributed amongst the remaining healthy priorities
  based on the relative health of the priorities, matching how load is distributed during regular
  host selection. For example, given priority healths of {100, 50, 50}, the original load will be
  {100, 0, 0} (since P0 has capacity to handle 100% of the traffic). If P0 is excluded, the load
  changes to {0, 50, 50}, because P1 is only able to handle 50% of the traffic, causing the
  remaining to spill over to P2.

  Each priority attempted will be excluded until there are no healthy priorities left, at which
  point the list of attempted priorities will be reset, essentially starting from the beginning.
  For example, given three priorities P0, P1, P2 with healthy % of 100, 0 and 50 respectively, the
  following sequence of priorities would be selected (assuming update_frequency = 1):
  Attempt 1: P0 (P0 is 100% healthy)
  Attempt 2: P2 (P0 already attempted, P2 only healthy priority)
  Attempt 3: P0 (no healthy priorities, reset)
  Attempt 4: P2

  In the case of all upstream hosts being unhealthy, no adjustments will be made to the original
  priority load, so behavior should be identical to not using this plugin.

  Using this PriorityFilter requires rebuilding the priority load, which runs in O(# of
  priorities), which might incur significant overhead for clusters with many priorities.
  [#extension: envoy.retry_priorities.previous_priorities]
  [#protodoc-title: Previous priorities retry selector]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :update_frequency, 1, type: :int32, json_name: "updateFrequency", deprecated: false
end
