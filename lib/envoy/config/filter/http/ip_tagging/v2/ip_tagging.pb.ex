defmodule Envoy.Config.Filter.Http.IpTagging.V2.IPTagging.RequestType do
  @moduledoc """
  The type of requests the filter should apply to. The supported types
  are internal, external or both. The
  :ref:`x-forwarded-for<config_http_conn_man_headers_x-forwarded-for_internal_origin>` header is
  used to determine if a request is internal and will result in
  :ref:`x-envoy-internal<config_http_conn_man_headers_x-envoy-internal>`
  being set. The filter defaults to both, and it will apply to all request types.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :BOTH, 0
  field :INTERNAL, 1
  field :EXTERNAL, 2
end

defmodule Envoy.Config.Filter.Http.IpTagging.V2.IPTagging.IPTag do
  @moduledoc """
  Supplies the IP tag name and the IP address subnets.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ip_tag_name, 1, type: :string, json_name: "ipTagName"
  field :ip_list, 2, repeated: true, type: Envoy.Api.V2.Core.CidrRange, json_name: "ipList"
end

defmodule Envoy.Config.Filter.Http.IpTagging.V2.IPTagging do
  @moduledoc """
  [#protodoc-title: IP tagging]
  IP tagging :ref:`configuration overview <config_http_filters_ip_tagging>`.
  [#extension: envoy.filters.http.ip_tagging]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_type, 1,
    type: Envoy.Config.Filter.Http.IpTagging.V2.IPTagging.RequestType,
    json_name: "requestType",
    enum: true,
    deprecated: false

  field :ip_tags, 4,
    repeated: true,
    type: Envoy.Config.Filter.Http.IpTagging.V2.IPTagging.IPTag,
    json_name: "ipTags",
    deprecated: false
end
