defmodule Envoy.Extensions.OutlierDetectionMonitors.Common.V3.HttpErrors do
  @moduledoc """
  [#protodoc-title: Outlier detection error buckets]
  Error bucket for HTTP codes.
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :range, 1, type: Envoy.Type.V3.Int32Range
end

defmodule Envoy.Extensions.OutlierDetectionMonitors.Common.V3.LocalOriginErrors do
  @moduledoc """
  Error bucket for locally originated errors.
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.OutlierDetectionMonitors.Common.V3.DatabaseErrors do
  @moduledoc """
  Error bucket for database errors.
  Sub-parameters may be added later, like malformed response, error on write, etc.
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.OutlierDetectionMonitors.Common.V3.ErrorBuckets do
  @moduledoc """
  Union of possible error buckets.
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http_errors, 1,
    repeated: true,
    type: Envoy.Extensions.OutlierDetectionMonitors.Common.V3.HttpErrors,
    json_name: "httpErrors"

  field :local_origin_errors, 2,
    repeated: true,
    type: Envoy.Extensions.OutlierDetectionMonitors.Common.V3.LocalOriginErrors,
    json_name: "localOriginErrors"

  field :database_errors, 3,
    repeated: true,
    type: Envoy.Extensions.OutlierDetectionMonitors.Common.V3.DatabaseErrors,
    json_name: "databaseErrors"
end
