defmodule StorageWeb.FileController do
  use StorageWeb, :controller
  @upload_path Application.compile_env(:storage, :upload_dir_path, "/home/tusqasi/sandbox/distributed/files_default/")

  action_fallback StorageWeb.FallbackController

  def index(conn, _params) do
    files = Storage.Files.list_files()
    render(conn, :index, files: files)
  end

  def create(conn, %{"file" => %Plug.Upload{path: path, filename: filename}}) do

    case File.exists?(@upload_path <> filename) do
      false -> File.cp(path, @upload_path <> filename)
      true -> nil
    end

    conn
    |> send_resp(:ok, "Uploaded image\n")
  end

  def create(conn, %{"file" => file_params}) do
    with {:ok, %Storage.Files.File{} = file} <- Storage.Files.create_file(file_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/files/#{file}")
      |> render(:show, file: file)
    end
  end

  def show(conn, %{"id" => id}) do
    file = Storage.Files.get_file!(id)
    render(conn, :show, file: file)
  end

  def update(conn, %{"id" => id, "file" => file_params}) do
    file = Storage.Files.get_file!(id)

    with {:ok, %Storage.Files.File{} = file} <- Storage.Files.update_file(file, file_params) do
      render(conn, :show, file: file)
    end
  end

  def delete(conn, %{"id" => id}) do
    file = Storage.Files.get_file!(id)

    with {:ok, %Storage.Files.File{}} <- Storage.Files.delete_file(file) do
      send_resp(conn, :no_content, "")
    end
  end
end
