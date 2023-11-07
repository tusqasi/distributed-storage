defmodule StorageWeb.ImageController do
  use StorageWeb, :controller
  
 action_fallback StorageWeb.FallbackController
  def upload_image(conn, params) do
    attrs = %{
      "user_id" => params["user_id"],
      "filename"=> params["filename"],
      "scale" => params["scale"]
      }

    Storage.Record.new_image(attrs)
    conn|>send_resp(201,"on")
  end

  def last_n(conn, params)do
      user_id = params["user_id"]
      n_images = params["n_images"]
      query = "select i.filename from records r, images i where r.user_id = $1 order by r.inserted_at asc LIMIT 5;"
      {:ok, result } = Ecto.Adapters.SQL.query(
      Storage.Repo,
      query, [ user_id|> Ecto.UUID.dump()|>elem(1) ])
      
    conn
    |> put_status(201)
    |> render(:last_n_data, images: result.rows)
  end
end
