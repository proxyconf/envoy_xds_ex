defmodule Envoy.Config.Rbac.V2.RBAC.Action do
  @moduledoc """
  Should we do safe-list or block-list style access control?
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ALLOW, 0
  field :DENY, 1
end

defmodule Envoy.Config.Rbac.V2.RBAC.PoliciesEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Rbac.V2.Policy
end

defmodule Envoy.Config.Rbac.V2.RBAC do
  @moduledoc """
  Role Based Access Control (RBAC) provides service-level and method-level access control for a
  service. RBAC policies are additive. The policies are examined in order. A request is allowed
  once a matching policy is found (suppose the `action` is ALLOW).

  Here is an example of RBAC configuration. It has two policies:

  * Service account "cluster.local/ns/default/sa/admin" has full access to the service, and so
  does "cluster.local/ns/default/sa/superuser".

  * Any user can read ("GET") the service at paths with prefix "/products", so long as the
  destination port is either 80 or 443.

  .. code-block:: yaml

  action: ALLOW
  policies:
  "service-admin":
  permissions:
  - any: true
  principals:
  - authenticated:
  principal_name:
  exact: "cluster.local/ns/default/sa/admin"
  - authenticated:
  principal_name:
  exact: "cluster.local/ns/default/sa/superuser"
  "product-viewer":
  permissions:
  - and_rules:
  rules:
  - header: { name: ":method", exact_match: "GET" }
  - url_path:
  path: { prefix: "/products" }
  - or_rules:
  rules:
  - destination_port: 80
  - destination_port: 443
  principals:
  - any: true
  [#protodoc-title: Role Based Access Control (RBAC)]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :action, 1, type: Envoy.Config.Rbac.V2.RBAC.Action, enum: true
  field :policies, 2, repeated: true, type: Envoy.Config.Rbac.V2.RBAC.PoliciesEntry, map: true
end

defmodule Envoy.Config.Rbac.V2.Policy do
  @moduledoc """
  Policy specifies a role and the principals that are assigned/denied the role. A policy matches if
  and only if at least one of its permissions match the action taking place AND at least one of its
  principals match the downstream AND the condition is true if specified.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :permissions, 1, repeated: true, type: Envoy.Config.Rbac.V2.Permission, deprecated: false
  field :principals, 2, repeated: true, type: Envoy.Config.Rbac.V2.Principal, deprecated: false
  field :condition, 3, type: Google.Api.Expr.V1alpha1.Expr
end

defmodule Envoy.Config.Rbac.V2.Permission.Set do
  @moduledoc """
  Used in the `and_rules` and `or_rules` fields in the `rule` oneof. Depending on the context,
  each are applied with the associated behavior.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rules, 1, repeated: true, type: Envoy.Config.Rbac.V2.Permission, deprecated: false
end

defmodule Envoy.Config.Rbac.V2.Permission do
  @moduledoc """
  Permission defines an action (or actions) that a principal can take.
  [#next-free-field: 11]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :rule, 0

  field :and_rules, 1, type: Envoy.Config.Rbac.V2.Permission.Set, json_name: "andRules", oneof: 0
  field :or_rules, 2, type: Envoy.Config.Rbac.V2.Permission.Set, json_name: "orRules", oneof: 0
  field :any, 3, type: :bool, oneof: 0, deprecated: false
  field :header, 4, type: Envoy.Api.V2.Route.HeaderMatcher, oneof: 0
  field :url_path, 10, type: Envoy.Type.Matcher.PathMatcher, json_name: "urlPath", oneof: 0

  field :destination_ip, 5,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "destinationIp",
    oneof: 0

  field :destination_port, 6,
    type: :uint32,
    json_name: "destinationPort",
    oneof: 0,
    deprecated: false

  field :metadata, 7, type: Envoy.Type.Matcher.MetadataMatcher, oneof: 0
  field :not_rule, 8, type: Envoy.Config.Rbac.V2.Permission, json_name: "notRule", oneof: 0

  field :requested_server_name, 9,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "requestedServerName",
    oneof: 0
end

defmodule Envoy.Config.Rbac.V2.Principal.Set do
  @moduledoc """
  Used in the `and_ids` and `or_ids` fields in the `identifier` oneof. Depending on the context,
  each are applied with the associated behavior.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ids, 1, repeated: true, type: Envoy.Config.Rbac.V2.Principal, deprecated: false
end

defmodule Envoy.Config.Rbac.V2.Principal.Authenticated do
  @moduledoc """
  Authentication attributes for a downstream.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :principal_name, 2, type: Envoy.Type.Matcher.StringMatcher, json_name: "principalName"
end

defmodule Envoy.Config.Rbac.V2.Principal do
  @moduledoc """
  Principal defines an identity or a group of identities for a downstream subject.
  [#next-free-field: 12]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :identifier, 0

  field :and_ids, 1, type: Envoy.Config.Rbac.V2.Principal.Set, json_name: "andIds", oneof: 0
  field :or_ids, 2, type: Envoy.Config.Rbac.V2.Principal.Set, json_name: "orIds", oneof: 0
  field :any, 3, type: :bool, oneof: 0, deprecated: false
  field :authenticated, 4, type: Envoy.Config.Rbac.V2.Principal.Authenticated, oneof: 0

  field :source_ip, 5,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "sourceIp",
    oneof: 0,
    deprecated: true

  field :direct_remote_ip, 10,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "directRemoteIp",
    oneof: 0

  field :remote_ip, 11, type: Envoy.Api.V2.Core.CidrRange, json_name: "remoteIp", oneof: 0
  field :header, 6, type: Envoy.Api.V2.Route.HeaderMatcher, oneof: 0
  field :url_path, 9, type: Envoy.Type.Matcher.PathMatcher, json_name: "urlPath", oneof: 0
  field :metadata, 7, type: Envoy.Type.Matcher.MetadataMatcher, oneof: 0
  field :not_id, 8, type: Envoy.Config.Rbac.V2.Principal, json_name: "notId", oneof: 0
end
