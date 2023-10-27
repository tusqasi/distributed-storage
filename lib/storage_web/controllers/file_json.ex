defmodule StorageWeb.FileJSON do
  alias Storage.Files.File

  @doc """
  Renders a list of files.
  """
  def index(%{files: files}) do
    %{data: for(file <- files, do: data(file))}
  end

  @doc """
  Renders a single file.
  """
  def show(%{file: file}) do
    %{data: data(file)}
  end

  defp data(%File{} = file) do
    %{
      id: file.id,
      filename: file.filename,
      filehash: file.filehash
    }
  end
end
