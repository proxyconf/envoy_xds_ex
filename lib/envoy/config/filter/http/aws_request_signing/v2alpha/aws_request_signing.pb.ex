defmodule Envoy.Config.Filter.Http.AwsRequestSigning.V2alpha.AwsRequestSigning do
  @moduledoc """
  Top level configuration for the AWS request signing filter.
  [#protodoc-title: AwsRequestSigning]
  AwsRequestSigning :ref:`configuration overview <config_http_filters_aws_request_signing>`.
  [#extension: envoy.filters.http.aws_request_signing]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :service_name, 1, type: :string, json_name: "serviceName", deprecated: false
  field :region, 2, type: :string, deprecated: false
  field :host_rewrite, 3, type: :string, json_name: "hostRewrite"
end
