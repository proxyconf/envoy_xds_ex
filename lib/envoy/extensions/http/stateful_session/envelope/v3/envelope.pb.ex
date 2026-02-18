defmodule Envoy.Extensions.Http.StatefulSession.Envelope.V3.EnvelopeSessionState.Header do
  use Protobuf,
    full_name: "envoy.extensions.http.stateful_session.envelope.v3.EnvelopeSessionState.Header",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Http.StatefulSession.Envelope.V3.EnvelopeSessionState do
  @moduledoc """
  The extension allows the session state is tracked via existing session context that initialized
  by the upstream server. It assumes that the upstream server will generate the session context
  (like session id header or cookie) in the initial response of the session and the client will use
  the same session context in the subsequent requests without any modification.

  When processing the response from the upstream, Envoy will check if the response contains the
  session context. If the response contains the session context, no matter if it's a new session
  context or an existing one, Envoy will join it and the upstream host as new session context.

  When processing the request from the downstream, Envoy will check if the request contains the
  session context. If the request contains the session context, Envoy will strip the
  upstream host from the session context.

  [#extension: envoy.http.stateful_session.envelope]
  [#protodoc-title: Envelope stateful session extension]
  """

  use Protobuf,
    full_name: "envoy.extensions.http.stateful_session.envelope.v3.EnvelopeSessionState",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :header, 1,
    type: Envoy.Extensions.Http.StatefulSession.Envelope.V3.EnvelopeSessionState.Header,
    deprecated: false
end
