defmodule Storage.LocalStorageTest do
  use Storage.DataCase

  alias Storage.LocalStorage

  describe "files" do
    alias Storage.LocalStorage.File

    import Storage.LocalStorageFixtures

    @invalid_attrs %{filehash: nil, filename: nil, uploader: nil}

    test "list_files/0 returns all files" do
      file = file_fixture()
      assert LocalStorage.list_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert LocalStorage.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      valid_attrs = %{
        filehash: "some filehash",
        filename: "some filename",
        uploader: "7488a646-e31f-11e4-aace-600308960662"
      }

      assert {:ok, %File{} = file} = LocalStorage.create_file(valid_attrs)
      assert file.filehash == "some filehash"
      assert file.filename == "some filename"
      assert file.uploader == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LocalStorage.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()

      update_attrs = %{
        filehash: "some updated filehash",
        filename: "some updated filename",
        uploader: "7488a646-e31f-11e4-aace-600308960668"
      }

      assert {:ok, %File{} = file} = LocalStorage.update_file(file, update_attrs)
      assert file.filehash == "some updated filehash"
      assert file.filename == "some updated filename"
      assert file.uploader == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = LocalStorage.update_file(file, @invalid_attrs)
      assert file == LocalStorage.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = LocalStorage.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> LocalStorage.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = LocalStorage.change_file(file)
    end
  end
end
