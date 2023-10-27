defmodule Storage.LocalStorageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Storage.LocalStorage` context.
  """

  @doc """
  Generate a file.
  """
  def file_fixture(attrs \\ %{}) do
    {:ok, file} =
      attrs
      |> Enum.into(%{
        filehash: "some filehash",
        filename: "some filename",
        uploader: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> Storage.LocalStorage.create_file()

    file
  end
end
