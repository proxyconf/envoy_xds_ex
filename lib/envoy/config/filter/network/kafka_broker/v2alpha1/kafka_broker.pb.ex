defmodule Envoy.Config.Filter.Network.KafkaBroker.V2alpha1.KafkaBroker do
  @moduledoc """
  [#protodoc-title: Kafka Broker]
  Kafka Broker :ref:`configuration overview <config_network_filters_kafka_broker>`.
  [#extension: envoy.filters.network.kafka_broker]
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :broker_address_rewrite_spec, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :force_response_rewrite, 2, type: :bool, json_name: "forceResponseRewrite"

  field :id_based_broker_address_rewrite_spec, 3,
    type: Envoy.Config.Filter.Network.KafkaBroker.V2alpha1.IdBasedBrokerRewriteSpec,
    json_name: "idBasedBrokerAddressRewriteSpec",
    oneof: 0

  field :api_keys_allowed, 4,
    repeated: true,
    type: :uint32,
    json_name: "apiKeysAllowed",
    deprecated: false

  field :api_keys_denied, 5,
    repeated: true,
    type: :uint32,
    json_name: "apiKeysDenied",
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.KafkaBroker.V2alpha1.IdBasedBrokerRewriteSpec do
  @moduledoc """
  Collection of rules matching by broker ID.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rules, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.KafkaBroker.V2alpha1.IdBasedBrokerRewriteRule
end

defmodule Envoy.Config.Filter.Network.KafkaBroker.V2alpha1.IdBasedBrokerRewriteRule do
  @moduledoc """
  Defines a rule to rewrite broker address data.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :id, 1, type: :uint32, deprecated: false
  field :host, 2, type: :string, deprecated: false
  field :port, 3, type: :uint32, deprecated: false
end
