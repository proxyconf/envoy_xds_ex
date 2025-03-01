defmodule Validate.KnownRegex do
  @moduledoc """
  WellKnownRegex contain some well-known patterns.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :UNKNOWN, 0
  field :HTTP_HEADER_NAME, 1
  field :HTTP_HEADER_VALUE, 2
end

defmodule Validate.FieldRules do
  @moduledoc """
  FieldRules encapsulates the rules for each type of field. Depending on the
  field, the correct set should be used to ensure proper validations.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  oneof :type, 0

  field :message, 17, optional: true, type: Validate.MessageRules
  field :float, 1, optional: true, type: Validate.FloatRules, oneof: 0
  field :double, 2, optional: true, type: Validate.DoubleRules, oneof: 0
  field :int32, 3, optional: true, type: Validate.Int32Rules, oneof: 0
  field :int64, 4, optional: true, type: Validate.Int64Rules, oneof: 0
  field :uint32, 5, optional: true, type: Validate.UInt32Rules, oneof: 0
  field :uint64, 6, optional: true, type: Validate.UInt64Rules, oneof: 0
  field :sint32, 7, optional: true, type: Validate.SInt32Rules, oneof: 0
  field :sint64, 8, optional: true, type: Validate.SInt64Rules, oneof: 0
  field :fixed32, 9, optional: true, type: Validate.Fixed32Rules, oneof: 0
  field :fixed64, 10, optional: true, type: Validate.Fixed64Rules, oneof: 0
  field :sfixed32, 11, optional: true, type: Validate.SFixed32Rules, oneof: 0
  field :sfixed64, 12, optional: true, type: Validate.SFixed64Rules, oneof: 0
  field :bool, 13, optional: true, type: Validate.BoolRules, oneof: 0
  field :string, 14, optional: true, type: Validate.StringRules, oneof: 0
  field :bytes, 15, optional: true, type: Validate.BytesRules, oneof: 0
  field :enum, 16, optional: true, type: Validate.EnumRules, oneof: 0
  field :repeated, 18, optional: true, type: Validate.RepeatedRules, oneof: 0
  field :map, 19, optional: true, type: Validate.MapRules, oneof: 0
  field :any, 20, optional: true, type: Validate.AnyRules, oneof: 0
  field :duration, 21, optional: true, type: Validate.DurationRules, oneof: 0
  field :timestamp, 22, optional: true, type: Validate.TimestampRules, oneof: 0
end

defmodule Validate.FloatRules do
  @moduledoc """
  FloatRules describes the constraints applied to `float` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :float
  field :lt, 2, optional: true, type: :float
  field :lte, 3, optional: true, type: :float
  field :gt, 4, optional: true, type: :float
  field :gte, 5, optional: true, type: :float
  field :in, 6, repeated: true, type: :float
  field :not_in, 7, repeated: true, type: :float, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.DoubleRules do
  @moduledoc """
  DoubleRules describes the constraints applied to `double` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :double
  field :lt, 2, optional: true, type: :double
  field :lte, 3, optional: true, type: :double
  field :gt, 4, optional: true, type: :double
  field :gte, 5, optional: true, type: :double
  field :in, 6, repeated: true, type: :double
  field :not_in, 7, repeated: true, type: :double, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.Int32Rules do
  @moduledoc """
  Int32Rules describes the constraints applied to `int32` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :int32
  field :lt, 2, optional: true, type: :int32
  field :lte, 3, optional: true, type: :int32
  field :gt, 4, optional: true, type: :int32
  field :gte, 5, optional: true, type: :int32
  field :in, 6, repeated: true, type: :int32
  field :not_in, 7, repeated: true, type: :int32, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.Int64Rules do
  @moduledoc """
  Int64Rules describes the constraints applied to `int64` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :int64
  field :lt, 2, optional: true, type: :int64
  field :lte, 3, optional: true, type: :int64
  field :gt, 4, optional: true, type: :int64
  field :gte, 5, optional: true, type: :int64
  field :in, 6, repeated: true, type: :int64
  field :not_in, 7, repeated: true, type: :int64, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.UInt32Rules do
  @moduledoc """
  UInt32Rules describes the constraints applied to `uint32` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :uint32
  field :lt, 2, optional: true, type: :uint32
  field :lte, 3, optional: true, type: :uint32
  field :gt, 4, optional: true, type: :uint32
  field :gte, 5, optional: true, type: :uint32
  field :in, 6, repeated: true, type: :uint32
  field :not_in, 7, repeated: true, type: :uint32, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.UInt64Rules do
  @moduledoc """
  UInt64Rules describes the constraints applied to `uint64` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :uint64
  field :lt, 2, optional: true, type: :uint64
  field :lte, 3, optional: true, type: :uint64
  field :gt, 4, optional: true, type: :uint64
  field :gte, 5, optional: true, type: :uint64
  field :in, 6, repeated: true, type: :uint64
  field :not_in, 7, repeated: true, type: :uint64, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.SInt32Rules do
  @moduledoc """
  SInt32Rules describes the constraints applied to `sint32` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :sint32
  field :lt, 2, optional: true, type: :sint32
  field :lte, 3, optional: true, type: :sint32
  field :gt, 4, optional: true, type: :sint32
  field :gte, 5, optional: true, type: :sint32
  field :in, 6, repeated: true, type: :sint32
  field :not_in, 7, repeated: true, type: :sint32, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.SInt64Rules do
  @moduledoc """
  SInt64Rules describes the constraints applied to `sint64` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :sint64
  field :lt, 2, optional: true, type: :sint64
  field :lte, 3, optional: true, type: :sint64
  field :gt, 4, optional: true, type: :sint64
  field :gte, 5, optional: true, type: :sint64
  field :in, 6, repeated: true, type: :sint64
  field :not_in, 7, repeated: true, type: :sint64, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.Fixed32Rules do
  @moduledoc """
  Fixed32Rules describes the constraints applied to `fixed32` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :fixed32
  field :lt, 2, optional: true, type: :fixed32
  field :lte, 3, optional: true, type: :fixed32
  field :gt, 4, optional: true, type: :fixed32
  field :gte, 5, optional: true, type: :fixed32
  field :in, 6, repeated: true, type: :fixed32
  field :not_in, 7, repeated: true, type: :fixed32, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.Fixed64Rules do
  @moduledoc """
  Fixed64Rules describes the constraints applied to `fixed64` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :fixed64
  field :lt, 2, optional: true, type: :fixed64
  field :lte, 3, optional: true, type: :fixed64
  field :gt, 4, optional: true, type: :fixed64
  field :gte, 5, optional: true, type: :fixed64
  field :in, 6, repeated: true, type: :fixed64
  field :not_in, 7, repeated: true, type: :fixed64, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.SFixed32Rules do
  @moduledoc """
  SFixed32Rules describes the constraints applied to `sfixed32` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :sfixed32
  field :lt, 2, optional: true, type: :sfixed32
  field :lte, 3, optional: true, type: :sfixed32
  field :gt, 4, optional: true, type: :sfixed32
  field :gte, 5, optional: true, type: :sfixed32
  field :in, 6, repeated: true, type: :sfixed32
  field :not_in, 7, repeated: true, type: :sfixed32, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.SFixed64Rules do
  @moduledoc """
  SFixed64Rules describes the constraints applied to `sfixed64` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :sfixed64
  field :lt, 2, optional: true, type: :sfixed64
  field :lte, 3, optional: true, type: :sfixed64
  field :gt, 4, optional: true, type: :sfixed64
  field :gte, 5, optional: true, type: :sfixed64
  field :in, 6, repeated: true, type: :sfixed64
  field :not_in, 7, repeated: true, type: :sfixed64, json_name: "notIn"
  field :ignore_empty, 8, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.BoolRules do
  @moduledoc """
  BoolRules describes the constraints applied to `bool` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :bool
end

defmodule Validate.StringRules do
  @moduledoc """
  StringRules describe the constraints applied to `string` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  oneof :well_known, 0

  field :const, 1, optional: true, type: :string
  field :len, 19, optional: true, type: :uint64
  field :min_len, 2, optional: true, type: :uint64, json_name: "minLen"
  field :max_len, 3, optional: true, type: :uint64, json_name: "maxLen"
  field :len_bytes, 20, optional: true, type: :uint64, json_name: "lenBytes"
  field :min_bytes, 4, optional: true, type: :uint64, json_name: "minBytes"
  field :max_bytes, 5, optional: true, type: :uint64, json_name: "maxBytes"
  field :pattern, 6, optional: true, type: :string
  field :prefix, 7, optional: true, type: :string
  field :suffix, 8, optional: true, type: :string
  field :contains, 9, optional: true, type: :string
  field :not_contains, 23, optional: true, type: :string, json_name: "notContains"
  field :in, 10, repeated: true, type: :string
  field :not_in, 11, repeated: true, type: :string, json_name: "notIn"
  field :email, 12, optional: true, type: :bool, oneof: 0
  field :hostname, 13, optional: true, type: :bool, oneof: 0
  field :ip, 14, optional: true, type: :bool, oneof: 0
  field :ipv4, 15, optional: true, type: :bool, oneof: 0
  field :ipv6, 16, optional: true, type: :bool, oneof: 0
  field :uri, 17, optional: true, type: :bool, oneof: 0
  field :uri_ref, 18, optional: true, type: :bool, json_name: "uriRef", oneof: 0
  field :address, 21, optional: true, type: :bool, oneof: 0
  field :uuid, 22, optional: true, type: :bool, oneof: 0

  field :well_known_regex, 24,
    optional: true,
    type: Validate.KnownRegex,
    json_name: "wellKnownRegex",
    enum: true,
    oneof: 0

  field :strict, 25, optional: true, type: :bool, default: true
  field :ignore_empty, 26, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.BytesRules do
  @moduledoc """
  BytesRules describe the constraints applied to `bytes` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  oneof :well_known, 0

  field :const, 1, optional: true, type: :bytes
  field :len, 13, optional: true, type: :uint64
  field :min_len, 2, optional: true, type: :uint64, json_name: "minLen"
  field :max_len, 3, optional: true, type: :uint64, json_name: "maxLen"
  field :pattern, 4, optional: true, type: :string
  field :prefix, 5, optional: true, type: :bytes
  field :suffix, 6, optional: true, type: :bytes
  field :contains, 7, optional: true, type: :bytes
  field :in, 8, repeated: true, type: :bytes
  field :not_in, 9, repeated: true, type: :bytes, json_name: "notIn"
  field :ip, 10, optional: true, type: :bool, oneof: 0
  field :ipv4, 11, optional: true, type: :bool, oneof: 0
  field :ipv6, 12, optional: true, type: :bool, oneof: 0
  field :ignore_empty, 14, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.EnumRules do
  @moduledoc """
  EnumRules describe the constraints applied to enum values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :const, 1, optional: true, type: :int32
  field :defined_only, 2, optional: true, type: :bool, json_name: "definedOnly"
  field :in, 3, repeated: true, type: :int32
  field :not_in, 4, repeated: true, type: :int32, json_name: "notIn"
end

defmodule Validate.MessageRules do
  @moduledoc """
  MessageRules describe the constraints applied to embedded message values.
  For message-type fields, validation is performed recursively.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :skip, 1, optional: true, type: :bool
  field :required, 2, optional: true, type: :bool
end

defmodule Validate.RepeatedRules do
  @moduledoc """
  RepeatedRules describe the constraints applied to `repeated` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :min_items, 1, optional: true, type: :uint64, json_name: "minItems"
  field :max_items, 2, optional: true, type: :uint64, json_name: "maxItems"
  field :unique, 3, optional: true, type: :bool
  field :items, 4, optional: true, type: Validate.FieldRules
  field :ignore_empty, 5, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.MapRules do
  @moduledoc """
  MapRules describe the constraints applied to `map` values
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :min_pairs, 1, optional: true, type: :uint64, json_name: "minPairs"
  field :max_pairs, 2, optional: true, type: :uint64, json_name: "maxPairs"
  field :no_sparse, 3, optional: true, type: :bool, json_name: "noSparse"
  field :keys, 4, optional: true, type: Validate.FieldRules
  field :values, 5, optional: true, type: Validate.FieldRules
  field :ignore_empty, 6, optional: true, type: :bool, json_name: "ignoreEmpty"
end

defmodule Validate.AnyRules do
  @moduledoc """
  AnyRules describe constraints applied exclusively to the
  `google.protobuf.Any` well-known type
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :required, 1, optional: true, type: :bool
  field :in, 2, repeated: true, type: :string
  field :not_in, 3, repeated: true, type: :string, json_name: "notIn"
end

defmodule Validate.DurationRules do
  @moduledoc """
  DurationRules describe the constraints applied exclusively to the
  `google.protobuf.Duration` well-known type
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :required, 1, optional: true, type: :bool
  field :const, 2, optional: true, type: Google.Protobuf.Duration
  field :lt, 3, optional: true, type: Google.Protobuf.Duration
  field :lte, 4, optional: true, type: Google.Protobuf.Duration
  field :gt, 5, optional: true, type: Google.Protobuf.Duration
  field :gte, 6, optional: true, type: Google.Protobuf.Duration
  field :in, 7, repeated: true, type: Google.Protobuf.Duration
  field :not_in, 8, repeated: true, type: Google.Protobuf.Duration, json_name: "notIn"
end

defmodule Validate.TimestampRules do
  @moduledoc """
  TimestampRules describe the constraints applied exclusively to the
  `google.protobuf.Timestamp` well-known type
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :required, 1, optional: true, type: :bool
  field :const, 2, optional: true, type: Google.Protobuf.Timestamp
  field :lt, 3, optional: true, type: Google.Protobuf.Timestamp
  field :lte, 4, optional: true, type: Google.Protobuf.Timestamp
  field :gt, 5, optional: true, type: Google.Protobuf.Timestamp
  field :gte, 6, optional: true, type: Google.Protobuf.Timestamp
  field :lt_now, 7, optional: true, type: :bool, json_name: "ltNow"
  field :gt_now, 8, optional: true, type: :bool, json_name: "gtNow"
  field :within, 9, optional: true, type: Google.Protobuf.Duration
end
