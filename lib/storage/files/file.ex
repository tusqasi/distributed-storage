defmodule Storage.Files.File do
  use Ecto.Schema
  import Ecto.Changeset

  schema "files" do
    field :filehash, :string
    field :filename, :string

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:filename, :filehash])
    |> validate_required([:filename, :filehash])
  end
end
