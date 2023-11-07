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

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        filename: "some filename",
        uploader: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> Storage.Files.create_image()

    image
  end

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        name: "some name",
        scale: 120.5
      })
      |> Storage.Files.create_image()

    image
  end

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        filename: "some filename",
        scale: 42
      })
      |> Storage.Files.create_image()

    image
  end

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        filename: "some filename"
      })
      |> Storage.Files.create_image()

    image
  end

  @doc """
  Generate a record.
  """
  def record_fixture(attrs \\ %{}) do
    {:ok, record} =
      attrs
      |> Enum.into(%{
        scale: 42
      })
      |> Storage.Files.create_record()

    record
  end

  @doc """
  Generate a record.
  """
  def record_fixture(attrs \\ %{}) do
    {:ok, record} =
      attrs
      |> Enum.into(%{

      })
      |> Storage.Files.create_record()

    record
  end
end
