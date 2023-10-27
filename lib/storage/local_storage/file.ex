defmodule Storage.LocalStorage.File do
  use Ecto.Schema
  import Ecto.Changeset

  schema "files" do
    field :filehash, :string
    field :filename, :string
    field :uploader, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:filename, :filehash, :uploader])
    |> validate_required([:filename, :filehash, :uploader])
  end
end
