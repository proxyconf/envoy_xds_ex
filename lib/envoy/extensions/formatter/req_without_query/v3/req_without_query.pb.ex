defmodule Envoy.Extensions.Formatter.ReqWithoutQuery.V3.ReqWithoutQuery do
  @moduledoc """
  Configuration for the request without query formatter.
  [#protodoc-title: Formatter extension for printing request without query string]
  [#extension: envoy.formatter.req_without_query]
  ReqWithoutQuery formatter extension implements REQ_WITHOUT_QUERY command operator that
  works the same way as :ref:`REQ <config_access_log_format_req>` except that it will
  remove the query string. It is used to avoid logging any sensitive information into
  the access log.
  See :ref:`here <config_access_log>` for more information on access log configuration.
  %REQ_WITHOUT_QUERY(X?Y):Z%
  An HTTP request header where X is the main HTTP header, Y is the alternative one, and Z is an
  optional parameter denoting string truncation up to Z characters long. The value is taken from
  the HTTP request header named X first and if it's not set, then request header Y is used. If
  none of the headers are present '-' symbol will be in the log.
  .. warning::
  Please use %PATH% to replace this extension.
  See :ref:`access log formats <config_access_log_format>` for more details.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end
