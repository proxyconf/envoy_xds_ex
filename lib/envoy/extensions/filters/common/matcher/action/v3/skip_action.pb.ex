defmodule Envoy.Extensions.Filters.Common.Matcher.Action.V3.SkipFilter do
  @moduledoc """
  Configuration for the SkipFilter match action. When matching results in this action, the
  associated filter will be ignored for all filter callbacks (e.g. ``encodeHeaders``, ``encodeData``,
  etc. for HTTP filters) after the matcher arrives at the match, including the callback that
  caused the match result. For example, when used with a HTTP filter and the match result was
  resolved after receiving the HTTP response headers, the HTTP filter will *not* receive the
  response header callback.

  As a result, if this match action is resolved before the first filter callback (e.g. HTTP request
  headers), the filter will be completely skipped.
  [#protodoc-title: Common match actions]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end
