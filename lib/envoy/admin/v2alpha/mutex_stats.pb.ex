defmodule Envoy.Admin.V2alpha.MutexStats do
  @moduledoc """
  Proto representation of the statistics collected upon absl::Mutex contention, if Envoy is run
  under :option:`--enable-mutex-tracing`. For more information, see the `absl::Mutex`
  [docs](https://abseil.io/about/design/mutex#extra-features).

  *NB*: The wait cycles below are measured by `absl::base_internal::CycleClock`, and may not
  correspond to core clock frequency. For more information, see the `CycleClock`
  [docs](https://github.com/abseil/abseil-cpp/blob/master/absl/base/internal/cycleclock.h).
  [#protodoc-title: MutexStats]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :num_contentions, 1, type: :uint64, json_name: "numContentions"
  field :current_wait_cycles, 2, type: :uint64, json_name: "currentWaitCycles"
  field :lifetime_wait_cycles, 3, type: :uint64, json_name: "lifetimeWaitCycles"
end
