defmodule Envoy.Extensions.Filters.Http.BasicAuth.V3.BasicAuth do
  @moduledoc """
  Basic HTTP authentication.

  Example:

  .. code-block:: yaml

  users:
  inline_string: |-
  user1:{SHA}hashed_user1_password
  user2:{SHA}hashed_user2_password
  [#protodoc-title: Basic Auth]
  Basic Auth :ref:`configuration overview <config_http_filters_basic_auth>`.
  [#extension: envoy.filters.http.basic_auth]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :users, 1, type: Envoy.Config.Core.V3.DataSource, deprecated: false

  field :forward_username_header, 2,
    type: :string,
    json_name: "forwardUsernameHeader",
    deprecated: false

  field :authentication_header, 3,
    type: :string,
    json_name: "authenticationHeader",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.BasicAuth.V3.BasicAuthPerRoute do
  @moduledoc """
  Extra settings that may be added to per-route configuration for
  a virtual host or a cluster.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :users, 1, type: Envoy.Config.Core.V3.DataSource, deprecated: false
end
