defmodule Envoy.Extensions.Common.Aws.V3.AwsCredentialProvider do
  @moduledoc """
  Configuration for AWS credential provider. This is optional and the credentials are normally
  retrieved from the environment or AWS configuration files by following the default credential
  provider chain. However, this configuration can be used to override the default behavior.
  [#next-free-field: 11]
  [#protodoc-title: AWS common configuration]
  """

  use Protobuf,
    full_name: "envoy.extensions.common.aws.v3.AwsCredentialProvider",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

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

  field :iam_roles_anywhere_credential_provider, 5,
    type: Envoy.Extensions.Common.Aws.V3.IAMRolesAnywhereCredentialProvider,
    json_name: "iamRolesAnywhereCredentialProvider"

  field :config_credential_provider, 6,
    type: Envoy.Extensions.Common.Aws.V3.ConfigCredentialProvider,
    json_name: "configCredentialProvider"

  field :container_credential_provider, 7,
    type: Envoy.Extensions.Common.Aws.V3.ContainerCredentialProvider,
    json_name: "containerCredentialProvider"

  field :environment_credential_provider, 8,
    type: Envoy.Extensions.Common.Aws.V3.EnvironmentCredentialProvider,
    json_name: "environmentCredentialProvider"

  field :instance_profile_credential_provider, 9,
    type: Envoy.Extensions.Common.Aws.V3.InstanceProfileCredentialProvider,
    json_name: "instanceProfileCredentialProvider"

  field :assume_role_credential_provider, 10,
    type: Envoy.Extensions.Common.Aws.V3.AssumeRoleCredentialProvider,
    json_name: "assumeRoleCredentialProvider"
end

defmodule Envoy.Extensions.Common.Aws.V3.InlineCredentialProvider do
  @moduledoc """
  Configuration to use an inline AWS credential. This is an equivalent to setting the well-known
  environment variables ``AWS_ACCESS_KEY_ID``, ``AWS_SECRET_ACCESS_KEY``, and the optional ``AWS_SESSION_TOKEN``.
  """

  use Protobuf,
    full_name: "envoy.extensions.common.aws.v3.InlineCredentialProvider",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :access_key_id, 1, type: :string, json_name: "accessKeyId", deprecated: false
  field :secret_access_key, 2, type: :string, json_name: "secretAccessKey", deprecated: false
  field :session_token, 3, type: :string, json_name: "sessionToken", deprecated: false
end

defmodule Envoy.Extensions.Common.Aws.V3.AssumeRoleWithWebIdentityCredentialProvider do
  @moduledoc """
  Configuration to use `AssumeRoleWithWebIdentity <https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithWebIdentity.html>`_
  to retrieve AWS credentials.
  """

  use Protobuf,
    full_name: "envoy.extensions.common.aws.v3.AssumeRoleWithWebIdentityCredentialProvider",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :web_identity_token_data_source, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "webIdentityTokenDataSource",
    deprecated: false

  field :role_arn, 2, type: :string, json_name: "roleArn", deprecated: false
  field :role_session_name, 3, type: :string, json_name: "roleSessionName"
end

defmodule Envoy.Extensions.Common.Aws.V3.CredentialsFileCredentialProvider do
  use Protobuf,
    full_name: "envoy.extensions.common.aws.v3.CredentialsFileCredentialProvider",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :credentials_data_source, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "credentialsDataSource",
    deprecated: false

  field :profile, 2, type: :string
end

defmodule Envoy.Extensions.Common.Aws.V3.IAMRolesAnywhereCredentialProvider do
  @moduledoc """
  Configuration to use `IAM Roles Anywhere <https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html>`_
  to retrieve AWS credentials.
  [#next-free-field: 9]
  """

  use Protobuf,
    full_name: "envoy.extensions.common.aws.v3.IAMRolesAnywhereCredentialProvider",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :role_arn, 1, type: :string, json_name: "roleArn", deprecated: false
  field :certificate, 2, type: Envoy.Config.Core.V3.DataSource, deprecated: false

  field :certificate_chain, 3,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "certificateChain"

  field :private_key, 4,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "privateKey",
    deprecated: false

  field :trust_anchor_arn, 5, type: :string, json_name: "trustAnchorArn", deprecated: false
  field :profile_arn, 6, type: :string, json_name: "profileArn", deprecated: false
  field :role_session_name, 7, type: :string, json_name: "roleSessionName"

  field :session_duration, 8,
    type: Google.Protobuf.Duration,
    json_name: "sessionDuration",
    deprecated: false
end

defmodule Envoy.Extensions.Common.Aws.V3.ConfigCredentialProvider do
  @moduledoc """
  The Config Credential Provider has no configurable parameters, but listing it in a custom credential provider chain will enable this
  credential provider.
  """

  use Protobuf,
    full_name: "envoy.extensions.common.aws.v3.ConfigCredentialProvider",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Common.Aws.V3.ContainerCredentialProvider do
  @moduledoc """
  The Container Credential Provider has no configurable parameters, but listing it in a custom credential provider chain will enable this
  credential provider.
  """

  use Protobuf,
    full_name: "envoy.extensions.common.aws.v3.ContainerCredentialProvider",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Common.Aws.V3.EnvironmentCredentialProvider do
  @moduledoc """
  The Environment Credential Provider has no configurable parameters, but listing it in a custom credential provider chain will enable this
  credential provider.
  """

  use Protobuf,
    full_name: "envoy.extensions.common.aws.v3.EnvironmentCredentialProvider",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Common.Aws.V3.InstanceProfileCredentialProvider do
  @moduledoc """
  The Instance Profile Credential Provider has no configurable parameters, but listing it in a custom credential provider chain will enable this
  credential provider.
  """

  use Protobuf,
    full_name: "envoy.extensions.common.aws.v3.InstanceProfileCredentialProvider",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Common.Aws.V3.AssumeRoleCredentialProvider do
  @moduledoc """
  Configuration to use `AssumeRole <https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html>`_ for retrieving new credentials, via role chaining.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.extensions.common.aws.v3.AssumeRoleCredentialProvider",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :role_arn, 1, type: :string, json_name: "roleArn", deprecated: false
  field :role_session_name, 2, type: :string, json_name: "roleSessionName"
  field :external_id, 3, type: :string, json_name: "externalId"

  field :session_duration, 4,
    type: Google.Protobuf.Duration,
    json_name: "sessionDuration",
    deprecated: false

  field :credential_provider, 5,
    type: Envoy.Extensions.Common.Aws.V3.AwsCredentialProvider,
    json_name: "credentialProvider"
end
