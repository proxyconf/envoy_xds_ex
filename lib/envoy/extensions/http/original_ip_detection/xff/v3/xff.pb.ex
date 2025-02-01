defmodule Envoy.Extensions.Http.OriginalIpDetection.Xff.V3.XffConfig do
  @moduledoc """
  This extension allows for the original downstream remote IP to be detected
  by reading the :ref:`config_http_conn_man_headers_x-forwarded-for` header.

  [#extension: envoy.http.original_ip_detection.xff]
  [#protodoc-title: XFF original IP detection extension]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :xff_num_trusted_hops, 1, type: :uint32, json_name: "xffNumTrustedHops"

  field :xff_trusted_cidrs, 2,
    type: Envoy.Extensions.Http.OriginalIpDetection.Xff.V3.XffTrustedCidrs,
    json_name: "xffTrustedCidrs"

  field :skip_xff_append, 3, type: Google.Protobuf.BoolValue, json_name: "skipXffAppend"
end

defmodule Envoy.Extensions.Http.OriginalIpDetection.Xff.V3.XffTrustedCidrs do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cidrs, 1, repeated: true, type: Envoy.Config.Core.V3.CidrRange
end
