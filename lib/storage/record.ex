defmodule Storage.Record do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "records" do

    field :user_id, :binary_id
    field :image_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:user_id, :image_id])
    |> validate_required([:user_id, :image_id])
  end

def new_image(attrs) do
    {:ok, %Storage.Image{id: image_id}} = %Storage.Image{}
    |> Storage.Image.changeset(attrs)
    |> Storage.Repo.insert()

    %Storage.Record{}
    |> Storage.Record.changeset(%{image_id: image_id, user_id: attrs["user_id"]})
    |> Storage.Repo.insert()
    end
end
