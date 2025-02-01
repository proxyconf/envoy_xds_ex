defmodule Envoy.Extensions.Common.Aws.V3.AwsCredentialProvider do
  @moduledoc """
  Configuration for AWS credential provider. This is optional and the credentials are normally
  retrieved from the environment or AWS configuration files by following the default credential
  provider chain. However, this configuration can be used to override the default behavior.
  [#protodoc-title: AWS common configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :assume_role_with_web_identity_provider, 1,
    type: Envoy.Extensions.Common.Aws.V3.AssumeRoleWithWebIdentityCredentialProvider,
    json_name: "assumeRoleWithWebIdentityProvider"

  field :inline_credential, 2,
    type: Envoy.Extensions.Common.Aws.V3.InlineCredentialProvider,
    json_name: "inlineCredential"

  field :credentials_file_provider, 3,
    type: Envoy.Extensions.Common.Aws.V3.CredentialsFileCredentialProvider,
    json_name: "credentialsFileProvider"

  field :custom_credential_provider_chain, 4,
    type: :bool,
    json_name: "customCredentialProviderChain"
end

defmodule Envoy.Extensions.Common.Aws.V3.InlineCredentialProvider do
  @moduledoc """
  Configuration to use an inline AWS credential. This is an equivalent to setting the well-known
  environment variables ``AWS_ACCESS_KEY_ID``, ``AWS_SECRET_ACCESS_KEY``, and the optional ``AWS_SESSION_TOKEN``.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :access_key_id, 1, type: :string, json_name: "accessKeyId", deprecated: false
  field :secret_access_key, 2, type: :string, json_name: "secretAccessKey", deprecated: false
  field :session_token, 3, type: :string, json_name: "sessionToken", deprecated: false
end

defmodule Envoy.Extensions.Common.Aws.V3.AssumeRoleWithWebIdentityCredentialProvider do
  @moduledoc """
  Configuration to use `AssumeRoleWithWebIdentity <https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithWebIdentity.html>`_
  to retrieve AWS credentials.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :web_identity_token_data_source, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "webIdentityTokenDataSource",
    deprecated: false

  field :role_arn, 2, type: :string, json_name: "roleArn", deprecated: false
  field :role_session_name, 3, type: :string, json_name: "roleSessionName"
end

defmodule Envoy.Extensions.Common.Aws.V3.CredentialsFileCredentialProvider do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :credentials_data_source, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "credentialsDataSource",
    deprecated: false

  field :profile, 2, type: :string
end
