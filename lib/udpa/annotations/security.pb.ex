defmodule Udpa.Annotations.FieldSecurityAnnotation do
  @moduledoc """
  These annotations indicate metadata for the purpose of understanding the
  security significance of fields.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :configure_for_untrusted_downstream, 1,
    type: :bool,
    json_name: "configureForUntrustedDownstream"

  field :configure_for_untrusted_upstream, 2,
    type: :bool,
    json_name: "configureForUntrustedUpstream"
end
