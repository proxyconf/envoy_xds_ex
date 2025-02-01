defmodule Xds.Core.V3.CollectionEntry.InlineEntry do
  @moduledoc """
  Inlined resource entry.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :version, 2, type: :string
  field :resource, 3, type: Google.Protobuf.Any
end

defmodule Xds.Core.V3.CollectionEntry do
  @moduledoc """
  xDS collection resource wrapper. This encapsulates a xDS resource when
  appearing inside a list collection resource. List collection resources are
  regular Resource messages of type:

  .. code-block:: proto

  message <T>Collection {
  repeated CollectionEntry resources = 1;
  }
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :resource_specifier, 0

  field :locator, 1, type: Xds.Core.V3.ResourceLocator, oneof: 0

  field :inline_entry, 2,
    type: Xds.Core.V3.CollectionEntry.InlineEntry,
    json_name: "inlineEntry",
    oneof: 0
end
