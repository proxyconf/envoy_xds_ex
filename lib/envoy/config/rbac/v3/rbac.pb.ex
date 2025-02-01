defmodule Envoy.Config.Rbac.V3.MetadataSource do
  @moduledoc """
  [#protodoc-title: Role Based Access Control (RBAC)]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DYNAMIC, 0
  field :ROUTE, 1
end

defmodule Envoy.Config.Rbac.V3.RBAC.Action do
  @moduledoc """
  Should we do safe-list or block-list style access control?
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ALLOW, 0
  field :DENY, 1
  field :LOG, 2
end

defmodule Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions.AuditCondition do
  @moduledoc """
  Deny and allow here refer to RBAC decisions, not actions.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NONE, 0
  field :ON_DENY, 1
  field :ON_ALLOW, 2
  field :ON_DENY_AND_ALLOW, 3
end

defmodule Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions.AuditLoggerConfig do
  @moduledoc """
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :audit_logger, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "auditLogger"

  field :is_optional, 2, type: :bool, json_name: "isOptional"
end

defmodule Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :audit_condition, 1,
    type: Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions.AuditCondition,
    json_name: "auditCondition",
    enum: true,
    deprecated: false

  field :logger_configs, 2,
    repeated: true,
    type: Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions.AuditLoggerConfig,
    json_name: "loggerConfigs"
end

defmodule Envoy.Config.Rbac.V3.RBAC.PoliciesEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Rbac.V3.Policy
end

defmodule Envoy.Config.Rbac.V3.RBAC do
  @moduledoc """
  Role Based Access Control (RBAC) provides service-level and method-level access control for a
  service. Requests are allowed or denied based on the ``action`` and whether a matching policy is
  found. For instance, if the action is ALLOW and a matching policy is found the request should be
  allowed.

  RBAC can also be used to make access logging decisions by communicating with access loggers
  through dynamic metadata. When the action is LOG and at least one policy matches, the
  ``access_log_hint`` value in the shared key namespace 'envoy.common' is set to ``true`` indicating
  the request should be logged.

  Here is an example of RBAC configuration. It has two policies:

  * Service account ``cluster.local/ns/default/sa/admin`` has full access to the service, and so
  does "cluster.local/ns/default/sa/superuser".

  * Any user can read (``GET``) the service at paths with prefix ``/products``, so long as the
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
  - header:
  name: ":method"
  string_match:
  exact: "GET"
  - url_path:
  path: { prefix: "/products" }
  - or_rules:
  rules:
  - destination_port: 80
  - destination_port: 443
  principals:
  - any: true
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :action, 1, type: Envoy.Config.Rbac.V3.RBAC.Action, enum: true, deprecated: false
  field :policies, 2, repeated: true, type: Envoy.Config.Rbac.V3.RBAC.PoliciesEntry, map: true

  field :audit_logging_options, 3,
    type: Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions,
    json_name: "auditLoggingOptions"
end

defmodule Envoy.Config.Rbac.V3.Policy do
  @moduledoc """
  Policy specifies a role and the principals that are assigned/denied the role.
  A policy matches if and only if at least one of its permissions match the
  action taking place AND at least one of its principals match the downstream
  AND the condition is true if specified.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :permissions, 1, repeated: true, type: Envoy.Config.Rbac.V3.Permission, deprecated: false
  field :principals, 2, repeated: true, type: Envoy.Config.Rbac.V3.Principal, deprecated: false
  field :condition, 3, type: Google.Api.Expr.V1alpha1.Expr, deprecated: false

  field :checked_condition, 4,
    type: Google.Api.Expr.V1alpha1.CheckedExpr,
    json_name: "checkedCondition",
    deprecated: false
end

defmodule Envoy.Config.Rbac.V3.SourcedMetadata do
  @moduledoc """
  SourcedMetadata enables matching against metadata from different sources in the request processing
  pipeline. It extends the base MetadataMatcher functionality by allowing specification of where the
  metadata should be sourced from, rather than only matching against dynamic metadata.

  The matcher can be configured to look up metadata from:

  * Dynamic metadata: Runtime metadata added by filters during request processing
  * Route metadata: Static metadata configured on the route entry
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :metadata_matcher, 1,
    type: Envoy.Type.Matcher.V3.MetadataMatcher,
    json_name: "metadataMatcher",
    deprecated: false

  field :metadata_source, 2,
    type: Envoy.Config.Rbac.V3.MetadataSource,
    json_name: "metadataSource",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Rbac.V3.Permission.Set do
  @moduledoc """
  Used in the ``and_rules`` and ``or_rules`` fields in the ``rule`` oneof. Depending on the context,
  each are applied with the associated behavior.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rules, 1, repeated: true, type: Envoy.Config.Rbac.V3.Permission, deprecated: false
end

defmodule Envoy.Config.Rbac.V3.Permission do
  @moduledoc """
  Permission defines an action (or actions) that a principal can take.
  [#next-free-field: 15]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :rule, 0

  field :and_rules, 1, type: Envoy.Config.Rbac.V3.Permission.Set, json_name: "andRules", oneof: 0
  field :or_rules, 2, type: Envoy.Config.Rbac.V3.Permission.Set, json_name: "orRules", oneof: 0
  field :any, 3, type: :bool, oneof: 0, deprecated: false
  field :header, 4, type: Envoy.Config.Route.V3.HeaderMatcher, oneof: 0
  field :url_path, 10, type: Envoy.Type.Matcher.V3.PathMatcher, json_name: "urlPath", oneof: 0

  field :destination_ip, 5,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "destinationIp",
    oneof: 0

  field :destination_port, 6,
    type: :uint32,
    json_name: "destinationPort",
    oneof: 0,
    deprecated: false

  field :destination_port_range, 11,
    type: Envoy.Type.V3.Int32Range,
    json_name: "destinationPortRange",
    oneof: 0

  field :metadata, 7, type: Envoy.Type.Matcher.V3.MetadataMatcher, oneof: 0, deprecated: true
  field :not_rule, 8, type: Envoy.Config.Rbac.V3.Permission, json_name: "notRule", oneof: 0

  field :requested_server_name, 9,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "requestedServerName",
    oneof: 0

  field :matcher, 12, type: Envoy.Config.Core.V3.TypedExtensionConfig, oneof: 0

  field :uri_template, 13,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "uriTemplate",
    oneof: 0

  field :sourced_metadata, 14,
    type: Envoy.Config.Rbac.V3.SourcedMetadata,
    json_name: "sourcedMetadata",
    oneof: 0
end

defmodule Envoy.Config.Rbac.V3.Principal.Set do
  @moduledoc """
  Used in the ``and_ids`` and ``or_ids`` fields in the ``identifier`` oneof.
  Depending on the context, each are applied with the associated behavior.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ids, 1, repeated: true, type: Envoy.Config.Rbac.V3.Principal, deprecated: false
end

defmodule Envoy.Config.Rbac.V3.Principal.Authenticated do
  @moduledoc """
  Authentication attributes for a downstream.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :principal_name, 2, type: Envoy.Type.Matcher.V3.StringMatcher, json_name: "principalName"
end

defmodule Envoy.Config.Rbac.V3.Principal do
  @moduledoc """
  Principal defines an identity or a group of identities for a downstream
  subject.
  [#next-free-field: 14]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :identifier, 0

  field :and_ids, 1, type: Envoy.Config.Rbac.V3.Principal.Set, json_name: "andIds", oneof: 0
  field :or_ids, 2, type: Envoy.Config.Rbac.V3.Principal.Set, json_name: "orIds", oneof: 0
  field :any, 3, type: :bool, oneof: 0, deprecated: false
  field :authenticated, 4, type: Envoy.Config.Rbac.V3.Principal.Authenticated, oneof: 0

  field :source_ip, 5,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "sourceIp",
    oneof: 0,
    deprecated: true

  field :direct_remote_ip, 10,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "directRemoteIp",
    oneof: 0

  field :remote_ip, 11, type: Envoy.Config.Core.V3.CidrRange, json_name: "remoteIp", oneof: 0
  field :header, 6, type: Envoy.Config.Route.V3.HeaderMatcher, oneof: 0
  field :url_path, 9, type: Envoy.Type.Matcher.V3.PathMatcher, json_name: "urlPath", oneof: 0
  field :metadata, 7, type: Envoy.Type.Matcher.V3.MetadataMatcher, oneof: 0, deprecated: true

  field :filter_state, 12,
    type: Envoy.Type.Matcher.V3.FilterStateMatcher,
    json_name: "filterState",
    oneof: 0

  field :not_id, 8, type: Envoy.Config.Rbac.V3.Principal, json_name: "notId", oneof: 0

  field :sourced_metadata, 13,
    type: Envoy.Config.Rbac.V3.SourcedMetadata,
    json_name: "sourcedMetadata",
    oneof: 0
end

defmodule Envoy.Config.Rbac.V3.Action do
  @moduledoc """
  Action defines the result of allowance or denial when a request matches the matcher.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :action, 2, type: Envoy.Config.Rbac.V3.RBAC.Action, enum: true
end
