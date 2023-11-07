defmodule Storage.FilesTest do
  use Storage.DataCase

  alias Storage.Files

  describe "files" do
    alias Storage.Files.File

    import Storage.FilesFixtures

    @invalid_attrs %{filehash: nil, filename: nil}

    test "list_files/0 returns all files" do
      file = file_fixture()
      assert Files.list_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert Files.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      valid_attrs = %{filehash: "some filehash", filename: "some filename"}

      assert {:ok, %File{} = file} = Files.create_file(valid_attrs)
      assert file.filehash == "some filehash"
      assert file.filename == "some filename"
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      update_attrs = %{filehash: "some updated filehash", filename: "some updated filename"}

      assert {:ok, %File{} = file} = Files.update_file(file, update_attrs)
      assert file.filehash == "some updated filehash"
      assert file.filename == "some updated filename"
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_file(file, @invalid_attrs)
      assert file == Files.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = Files.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> Files.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = Files.change_file(file)
    end
  end

  describe "images" do
    alias Storage.Files.Image

    import Storage.FilesFixtures

    @invalid_attrs %{filename: nil, uploader: nil}

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Files.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Files.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      valid_attrs = %{filename: "some filename", uploader: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %Image{} = image} = Files.create_image(valid_attrs)
      assert image.filename == "some filename"
      assert image.uploader == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()

      update_attrs = %{
        filename: "some updated filename",
        uploader: "7488a646-e31f-11e4-aace-600308960668"
      }

      assert {:ok, %Image{} = image} = Files.update_image(image, update_attrs)
      assert image.filename == "some updated filename"
      assert image.uploader == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_image(image, @invalid_attrs)
      assert image == Files.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Files.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Files.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Files.change_image(image)
    end
  end

  describe "images" do
    alias Storage.Files.Image

    import Storage.FilesFixtures

    @invalid_attrs %{name: nil, scale: nil}

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Files.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Files.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      valid_attrs = %{name: "some name", scale: 120.5}

      assert {:ok, %Image{} = image} = Files.create_image(valid_attrs)
      assert image.name == "some name"
      assert image.scale == 120.5
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      update_attrs = %{name: "some updated name", scale: 456.7}

      assert {:ok, %Image{} = image} = Files.update_image(image, update_attrs)
      assert image.name == "some updated name"
      assert image.scale == 456.7
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_image(image, @invalid_attrs)
      assert image == Files.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Files.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Files.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Files.change_image(image)
    end
  end

  describe "images" do
    alias Storage.Files.Image

    import Storage.FilesFixtures

    @invalid_attrs %{filename: nil, scale: nil}

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Files.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Files.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      valid_attrs = %{filename: "some filename", scale: 42}

      assert {:ok, %Image{} = image} = Files.create_image(valid_attrs)
      assert image.filename == "some filename"
      assert image.scale == 42
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      update_attrs = %{filename: "some updated filename", scale: 43}

      assert {:ok, %Image{} = image} = Files.update_image(image, update_attrs)
      assert image.filename == "some updated filename"
      assert image.scale == 43
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_image(image, @invalid_attrs)
      assert image == Files.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Files.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Files.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Files.change_image(image)
    end
  end

  describe "images" do
    alias Storage.Files.Image

    import Storage.FilesFixtures

    @invalid_attrs %{filename: nil}

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Files.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Files.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      valid_attrs = %{filename: "some filename"}

      assert {:ok, %Image{} = image} = Files.create_image(valid_attrs)
      assert image.filename == "some filename"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      update_attrs = %{filename: "some updated filename"}

      assert {:ok, %Image{} = image} = Files.update_image(image, update_attrs)
      assert image.filename == "some updated filename"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_image(image, @invalid_attrs)
      assert image == Files.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Files.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Files.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Files.change_image(image)
    end
  end

  describe "records" do
    alias Storage.Files.Record

    import Storage.FilesFixtures

    @invalid_attrs %{scale: nil}

    test "list_records/0 returns all records" do
      record = record_fixture()
      assert Files.list_records() == [record]
    end

    test "get_record!/1 returns the record with given id" do
      record = record_fixture()
      assert Files.get_record!(record.id) == record
    end

    test "create_record/1 with valid data creates a record" do
      valid_attrs = %{scale: 42}

      assert {:ok, %Record{} = record} = Files.create_record(valid_attrs)
      assert record.scale == 42
    end

    test "create_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_record(@invalid_attrs)
    end

    test "update_record/2 with valid data updates the record" do
      record = record_fixture()
      update_attrs = %{scale: 43}

      assert {:ok, %Record{} = record} = Files.update_record(record, update_attrs)
      assert record.scale == 43
    end

    test "update_record/2 with invalid data returns error changeset" do
      record = record_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_record(record, @invalid_attrs)
      assert record == Files.get_record!(record.id)
    end

    test "delete_record/1 deletes the record" do
      record = record_fixture()
      assert {:ok, %Record{}} = Files.delete_record(record)
      assert_raise Ecto.NoResultsError, fn -> Files.get_record!(record.id) end
    end

    test "change_record/1 returns a record changeset" do
      record = record_fixture()
      assert %Ecto.Changeset{} = Files.change_record(record)
    end
  end

  describe "records" do
    alias Storage.Files.Record

    import Storage.FilesFixtures

    @invalid_attrs %{}

    test "list_records/0 returns all records" do
      record = record_fixture()
      assert Files.list_records() == [record]
    end

    test "get_record!/1 returns the record with given id" do
      record = record_fixture()
      assert Files.get_record!(record.id) == record
    end

    test "create_record/1 with valid data creates a record" do
      valid_attrs = %{}

      assert {:ok, %Record{} = record} = Files.create_record(valid_attrs)
    end

    test "create_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_record(@invalid_attrs)
    end

    test "update_record/2 with valid data updates the record" do
      record = record_fixture()
      update_attrs = %{}

      assert {:ok, %Record{} = record} = Files.update_record(record, update_attrs)
    end

    test "update_record/2 with invalid data returns error changeset" do
      record = record_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_record(record, @invalid_attrs)
      assert record == Files.get_record!(record.id)
    end

    test "delete_record/1 deletes the record" do
      record = record_fixture()
      assert {:ok, %Record{}} = Files.delete_record(record)
      assert_raise Ecto.NoResultsError, fn -> Files.get_record!(record.id) end
    end

    test "change_record/1 returns a record changeset" do
      record = record_fixture()
      assert %Ecto.Changeset{} = Files.change_record(record)
    end
  end
end
