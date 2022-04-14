defmodule AuthTutorialPhoenixWeb.PermissionControllerTest do
  use AuthTutorialPhoenixWeb.ConnCase

  import AuthTutorialPhoenix.AccountsFixtures

  alias AuthTutorialPhoenix.Accounts.Permission

  @create_attrs %{
    delete: true,
    inserted_by: "some inserted_by",
    permission_name: "some permission_name",
    read: true,
    updated_by: "some updated_by",
    write: true
  }
  @update_attrs %{
    delete: false,
    inserted_by: "some updated inserted_by",
    permission_name: "some updated permission_name",
    read: false,
    updated_by: "some updated updated_by",
    write: false
  }
  @invalid_attrs %{delete: nil, inserted_by: nil, permission_name: nil, read: nil, updated_by: nil, write: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all permissions", %{conn: conn} do
      conn = get(conn, Routes.permission_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create permission" do
    test "renders permission when data is valid", %{conn: conn} do
      conn = post(conn, Routes.permission_path(conn, :create), permission: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.permission_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "delete" => true,
               "inserted_by" => "some inserted_by",
               "permission_name" => "some permission_name",
               "read" => true,
               "updated_by" => "some updated_by",
               "write" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.permission_path(conn, :create), permission: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update permission" do
    setup [:create_permission]

    test "renders permission when data is valid", %{conn: conn, permission: %Permission{id: id} = permission} do
      conn = put(conn, Routes.permission_path(conn, :update, permission), permission: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.permission_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "delete" => false,
               "inserted_by" => "some updated inserted_by",
               "permission_name" => "some updated permission_name",
               "read" => false,
               "updated_by" => "some updated updated_by",
               "write" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, permission: permission} do
      conn = put(conn, Routes.permission_path(conn, :update, permission), permission: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete permission" do
    setup [:create_permission]

    test "deletes chosen permission", %{conn: conn, permission: permission} do
      conn = delete(conn, Routes.permission_path(conn, :delete, permission))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.permission_path(conn, :show, permission))
      end
    end
  end

  defp create_permission(_) do
    permission = permission_fixture()
    %{permission: permission}
  end
end
