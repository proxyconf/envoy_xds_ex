defmodule Envoy.Extensions.Filters.Http.AwsRequestSigning.V3.AwsRequestSigning.SigningAlgorithm do
  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.filters.http.aws_request_signing.v3.AwsRequestSigning.SigningAlgorithm",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :AWS_SIGV4, 0
  field :AWS_SIGV4A, 1
end

defmodule Envoy.Extensions.Filters.Http.AwsRequestSigning.V3.AwsRequestSigning.QueryString do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.aws_request_signing.v3.AwsRequestSigning.QueryString",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :expiration_time, 1,
    type: Google.Protobuf.Duration,
    json_name: "expirationTime",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.AwsRequestSigning.V3.AwsRequestSigning do
  @moduledoc """
  Top level configuration for the AWS request signing filter.
  [#next-free-field: 10]
  [#protodoc-title: AwsRequestSigning]
  AwsRequestSigning :ref:`configuration overview <config_http_filters_aws_request_signing>`.
  [#extension: envoy.filters.http.aws_request_signing]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.aws_request_signing.v3.AwsRequestSigning",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :service_name, 1, type: :string, json_name: "serviceName", deprecated: false
  field :region, 2, type: :string
  field :host_rewrite, 3, type: :string, json_name: "hostRewrite"
  field :use_unsigned_payload, 4, type: :bool, json_name: "useUnsignedPayload"

  field :match_excluded_headers, 5,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "matchExcludedHeaders"

  field :signing_algorithm, 6,
    type: Envoy.Extensions.Filters.Http.AwsRequestSigning.V3.AwsRequestSigning.SigningAlgorithm,
    json_name: "signingAlgorithm",
    enum: true

  field :query_string, 7,
    type: Envoy.Extensions.Filters.Http.AwsRequestSigning.V3.AwsRequestSigning.QueryString,
    json_name: "queryString"

  field :credential_provider, 8,
    type: Envoy.Extensions.Common.Aws.V3.AwsCredentialProvider,
    json_name: "credentialProvider"

  field :match_included_headers, 9,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "matchIncludedHeaders"
end

defmodule Envoy.Extensions.Filters.Http.AwsRequestSigning.V3.AwsRequestSigningPerRoute do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.aws_request_signing.v3.AwsRequestSigningPerRoute",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :aws_request_signing, 1,
    type: Envoy.Extensions.Filters.Http.AwsRequestSigning.V3.AwsRequestSigning,
    json_name: "awsRequestSigning"

  field :stat_prefix, 2, type: :string, json_name: "statPrefix", deprecated: false
end
