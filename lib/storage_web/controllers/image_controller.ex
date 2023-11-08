defmodule StorageWeb.ImageController do
  use StorageWeb, :controller
  require Logger

  @files_path Application.compile_env(:storage, :files_path, "../files/")
  action_fallback(StorageWeb.FallbackController)

  @spec upload_image(Plug.Conn, %{
          user_id: String,
          filename: String,
          scale: String,
          file: Plug.Upload
        }) ::
          Plug.Conn
  def upload_image(conn, %{
        "file" => %Plug.Upload{} = file,
        "scale" => scale,
        "user_id" => user_id
      }) do
    case(Ecto.UUID.dump(user_id)) do
      {:ok, _} ->
        attrs = %{
          "user_id" => user_id,
          "filename" => file.filename,
          "scale" => scale
        }

        Storage.Record.new_record(attrs)
        File.cp(file.path, @files_path <> file.filename)
        File.rm(file.path)

        conn
        |> send_resp(201, "Image added")

      _ ->
        Logger.warn("Received user_id not valid uuid")

        conn
        |> send_resp(400, "user_id not valid uuid")
    end
  end

  def last_n(conn, params) do
    # TODO:
    # Check user_id
    # Implement n_images
    # Check n_images
    user_id = params["user_id"]

    case Ecto.UUID.dump(user_id) do
      {:ok, _} ->
        n_images = params["n_images"] || 10
        query = "select i.filename from records r, images i 
          where r.user_id = $1
          order by r.inserted_at asc
          LIMIT $2;"

        {:ok, result} =
          Ecto.Adapters.SQL.query(
            Storage.Repo,
            query,
            [user_id |> Ecto.UUID.dump() |> elem(1), n_images]
          )

        conn
        |> put_status(201)
        |> render(:last_n_data, images: result.rows)

      _ ->
        Logger.warn("Received user_id not valid uuid")

        conn
        |> send_resp(400, "user_id not valid uuid")
    end
  end
end
