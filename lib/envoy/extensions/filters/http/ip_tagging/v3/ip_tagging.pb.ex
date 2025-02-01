defmodule Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.RequestType do
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

defmodule Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.IpTagHeader.HeaderAction do
  @moduledoc """
  Describes how to apply the tags to the headers.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :SANITIZE, 0
  field :APPEND_IF_EXISTS_OR_ADD, 1
end

defmodule Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.IPTag do
  @moduledoc """
  Supplies the IP tag name and the IP address subnets.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ip_tag_name, 1, type: :string, json_name: "ipTagName"
  field :ip_list, 2, repeated: true, type: Envoy.Config.Core.V3.CidrRange, json_name: "ipList"
end

defmodule Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.IpTagHeader do
  @moduledoc """
  Specify to which header the tags will be written.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header, 1, type: :string, deprecated: false

  field :action, 2,
    type: Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.IpTagHeader.HeaderAction,
    enum: true
end

defmodule Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging do
  @moduledoc """
  [#next-free-field: 6]
  [#protodoc-title: IP tagging]
  IP tagging :ref:`configuration overview <config_http_filters_ip_tagging>`.
  [#extension: envoy.filters.http.ip_tagging]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_type, 1,
    type: Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.RequestType,
    json_name: "requestType",
    enum: true,
    deprecated: false

  field :ip_tags, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.IPTag,
    json_name: "ipTags",
    deprecated: false

  field :ip_tag_header, 5,
    type: Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.IpTagHeader,
    json_name: "ipTagHeader"
end
