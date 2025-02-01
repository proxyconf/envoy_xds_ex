defmodule Envoy.Data.Dns.V3.DnsTable.AddressList do
  @moduledoc """
  This message contains a list of IP addresses returned for a query for a known name
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address, 1, repeated: true, type: :string, deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsServiceProtocol do
  @moduledoc """
  Specify the service protocol using a numeric or string value
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :protocol_config, 0

  field :number, 1, type: :uint32, oneof: 0, deprecated: false
  field :name, 2, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsServiceTarget do
  @moduledoc """
  Specify the target for a given DNS service
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :endpoint_type, 0

  field :host_name, 1, type: :string, json_name: "hostName", oneof: 0, deprecated: false
  field :cluster_name, 2, type: :string, json_name: "clusterName", oneof: 0, deprecated: false
  field :priority, 3, type: :uint32, deprecated: false
  field :weight, 4, type: :uint32, deprecated: false
  field :port, 5, type: :uint32, deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsService do
  @moduledoc """
  This message defines a service selection record returned for a service query in a domain
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :service_name, 1, type: :string, json_name: "serviceName", deprecated: false
  field :protocol, 2, type: Envoy.Data.Dns.V3.DnsTable.DnsServiceProtocol
  field :ttl, 3, type: Google.Protobuf.Duration, deprecated: false

  field :targets, 4,
    repeated: true,
    type: Envoy.Data.Dns.V3.DnsTable.DnsServiceTarget,
    deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsServiceList do
  @moduledoc """
  Define a list of service records for a given service
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :services, 1,
    repeated: true,
    type: Envoy.Data.Dns.V3.DnsTable.DnsService,
    deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsEndpoint do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :endpoint_config, 0

  field :address_list, 1,
    type: Envoy.Data.Dns.V3.DnsTable.AddressList,
    json_name: "addressList",
    oneof: 0

  field :cluster_name, 2, type: :string, json_name: "clusterName", oneof: 0

  field :service_list, 3,
    type: Envoy.Data.Dns.V3.DnsTable.DnsServiceList,
    json_name: "serviceList",
    oneof: 0
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsVirtualDomain do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :endpoint, 2, type: Envoy.Data.Dns.V3.DnsTable.DnsEndpoint
  field :answer_ttl, 3, type: Google.Protobuf.Duration, json_name: "answerTtl", deprecated: false
end

defmodule Envoy.Data.Dns.V3.DnsTable do
  @moduledoc """
  This message contains the configuration for the DNS Filter if populated
  from the control plane
  [#protodoc-title: DNS Filter Table Data]
  :ref:`DNS Filter config overview <config_udp_listener_filters_dns_filter>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :external_retry_count, 1,
    type: :uint32,
    json_name: "externalRetryCount",
    deprecated: false

  field :virtual_domains, 2,
    repeated: true,
    type: Envoy.Data.Dns.V3.DnsTable.DnsVirtualDomain,
    json_name: "virtualDomains"

  field :known_suffixes, 3,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "knownSuffixes",
    deprecated: true
end
