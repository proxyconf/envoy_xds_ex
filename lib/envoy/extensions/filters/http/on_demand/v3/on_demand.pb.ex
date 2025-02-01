defmodule Envoy.Extensions.Filters.Http.OnDemand.V3.OnDemandCds do
  @moduledoc """
  Configuration of on-demand CDS.
  [#protodoc-title: On Demand Discovery]
  On Demand Discovery :ref:`configuration overview <config_http_filters_on_demand>`.
  [#extension: envoy.filters.http.on_demand]

  .. warning::

  Envoy currently only supports On-demand CDS when using Incremental-xDS and not State-of-the-World.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :source, 1, type: Envoy.Config.Core.V3.ConfigSource, deprecated: false
  field :resources_locator, 2, type: :string, json_name: "resourcesLocator"
  field :timeout, 3, type: Google.Protobuf.Duration
end

defmodule Envoy.Extensions.Filters.Http.OnDemand.V3.OnDemand do
  @moduledoc """
  On Demand Discovery filter config.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :odcds, 1, type: Envoy.Extensions.Filters.Http.OnDemand.V3.OnDemandCds
end

defmodule Envoy.Extensions.Filters.Http.OnDemand.V3.PerRouteConfig do
  @moduledoc """
  Per-route configuration for On Demand Discovery.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :odcds, 1, type: Envoy.Extensions.Filters.Http.OnDemand.V3.OnDemandCds
end
