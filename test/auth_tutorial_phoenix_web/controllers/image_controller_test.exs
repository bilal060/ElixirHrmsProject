defmodule AuthTutorialPhoenixWeb.ImageControllerTest do
  use AuthTutorialPhoenixWeb.ConnCase

  import AuthTutorialPhoenix.AccountsFixtures

  alias AuthTutorialPhoenix.Accounts.Image

  @create_attrs %{
    content_type: "some content_type",
    filename: "some filename",
    path: "some path"
  }
  @update_attrs %{
    content_type: "some updated content_type",
    filename: "some updated filename",
    path: "some updated path"
  }
  @invalid_attrs %{content_type: nil, filename: nil, path: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all images", %{conn: conn} do
      conn = get(conn, Routes.image_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create image" do
    test "renders image when data is valid", %{conn: conn} do
      conn = post(conn, Routes.image_path(conn, :create), image: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.image_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "content_type" => "some content_type",
               "filename" => "some filename",
               "path" => "some path"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.image_path(conn, :create), image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update image" do
    setup [:create_image]

    test "renders image when data is valid", %{conn: conn, image: %Image{id: id} = image} do
      conn = put(conn, Routes.image_path(conn, :update, image), image: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.image_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "content_type" => "some updated content_type",
               "filename" => "some updated filename",
               "path" => "some updated path"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, image: image} do
      conn = put(conn, Routes.image_path(conn, :update, image), image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete image" do
    setup [:create_image]

    test "deletes chosen image", %{conn: conn, image: image} do
      conn = delete(conn, Routes.image_path(conn, :delete, image))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.image_path(conn, :show, image))
      end
    end
  end

  defp create_image(_) do
    image = image_fixture()
    %{image: image}
  end
end
