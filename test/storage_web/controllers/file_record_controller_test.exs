defmodule StorageWeb.FileRecordControllerTest do
  use StorageWeb.ConnCase

  import Storage.FilesFixtures

  alias Storage.Files.FileRecord

  @create_attrs %{
    factor: 120.5,
    file_id: "7488a646-e31f-11e4-aace-600308960662",
    user_id: "7488a646-e31f-11e4-aace-600308960662"
  }
  @update_attrs %{
    factor: 456.7,
    file_id: "7488a646-e31f-11e4-aace-600308960668",
    user_id: "7488a646-e31f-11e4-aace-600308960668"
  }
  @invalid_attrs %{factor: nil, file_id: nil, user_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all file_record", %{conn: conn} do
      conn = get(conn, ~p"/api/file_record")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create file_record" do
    test "renders file_record when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/file_record", file_record: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/file_record/#{id}")

      assert %{
               "id" => ^id,
               "factor" => 120.5,
               "file_id" => "7488a646-e31f-11e4-aace-600308960662",
               "user_id" => "7488a646-e31f-11e4-aace-600308960662"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/file_record", file_record: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update file_record" do
    setup [:create_file_record]

    test "renders file_record when data is valid", %{
      conn: conn,
      file_record: %FileRecord{id: id} = file_record
    } do
      conn = put(conn, ~p"/api/file_record/#{file_record}", file_record: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/file_record/#{id}")

      assert %{
               "id" => ^id,
               "factor" => 456.7,
               "file_id" => "7488a646-e31f-11e4-aace-600308960668",
               "user_id" => "7488a646-e31f-11e4-aace-600308960668"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, file_record: file_record} do
      conn = put(conn, ~p"/api/file_record/#{file_record}", file_record: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete file_record" do
    setup [:create_file_record]

    test "deletes chosen file_record", %{conn: conn, file_record: file_record} do
      conn = delete(conn, ~p"/api/file_record/#{file_record}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/file_record/#{file_record}")
      end
    end
  end

  defp create_file_record(_) do
    file_record = file_record_fixture()
    %{file_record: file_record}
  end
end
