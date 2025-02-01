defmodule Envoy.Type.Http.V3.PathTransformation.Operation.NormalizePathRFC3986 do
  @moduledoc """
  Should text be normalized according to RFC 3986? This typically is used for path headers
  before any processing of requests by HTTP filters or routing. This applies percent-encoded
  normalization and path segment normalization. Fails on characters disallowed in URLs
  (e.g. NULLs). See `Normalization and Comparison
  <https://tools.ietf.org/html/rfc3986#section-6>`_ for details of normalization. Note that
  this options does not perform `case normalization
  <https://tools.ietf.org/html/rfc3986#section-6.2.2.1>`_
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Type.Http.V3.PathTransformation.Operation.MergeSlashes do
  @moduledoc """
  Determines if adjacent slashes are merged into one. A common use case is for a request path
  header. Using this option in ``:ref: PathNormalizationOptions
  <envoy_v3_api_msg_extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.PathNormalizationOptions>``
  will allow incoming requests with path ``//dir///file`` to match against route with ``prefix``
  match set to ``/dir``. When using for header transformations, note that slash merging is not
  part of `HTTP spec <https://tools.ietf.org/html/rfc3986>`_ and is provided for convenience.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Type.Http.V3.PathTransformation.Operation do
  @moduledoc """
  A type of operation to alter text.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :operation_specifier, 0

  field :normalize_path_rfc_3986, 2,
    type: Envoy.Type.Http.V3.PathTransformation.Operation.NormalizePathRFC3986,
    json_name: "normalizePathRfc3986",
    oneof: 0

  field :merge_slashes, 3,
    type: Envoy.Type.Http.V3.PathTransformation.Operation.MergeSlashes,
    json_name: "mergeSlashes",
    oneof: 0
end

defmodule Envoy.Type.Http.V3.PathTransformation do
  @moduledoc """
  [#protodoc-title: Path Transformations API]
  PathTransformation defines an API to apply a sequence of operations that can be used to alter
  text before it is used for matching or routing. Multiple actions can be applied in the same
  Transformation, forming a sequential pipeline. The transformations will be performed in the order
  that they appear.

  This API is a work in progress.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :operations, 1, repeated: true, type: Envoy.Type.Http.V3.PathTransformation.Operation
end
