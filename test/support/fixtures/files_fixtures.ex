defmodule Storage.FilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Storage.Files` context.
  """

  @doc """
  Generate a file.
  """
  def file_fixture(attrs \\ %{}) do
    {:ok, file} =
      attrs
      |> Enum.into(%{
        filehash: "some filehash",
        filename: "some filename"
      })
      |> Storage.Files.create_file()

    file
  end
end
