defmodule AuthTutorialPhoenixWeb.AttendanceControllerTest do
  use AuthTutorialPhoenixWeb.ConnCase

  import AuthTutorialPhoenix.AccountsFixtures

  alias AuthTutorialPhoenix.Accounts.Attendance

  @create_attrs %{
    check_in: "some check_in",
    checkout: "some checkout"
  }
  @update_attrs %{
    check_in: "some updated check_in",
    checkout: "some updated checkout"
  }
  @invalid_attrs %{check_in: nil, checkout: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all attendances", %{conn: conn} do
      conn = get(conn, Routes.attendance_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create attendance" do
    test "renders attendance when data is valid", %{conn: conn} do
      conn = post(conn, Routes.attendance_path(conn, :create), attendance: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.attendance_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "check_in" => "some check_in",
               "checkout" => "some checkout"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.attendance_path(conn, :create), attendance: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update attendance" do
    setup [:create_attendance]

    test "renders attendance when data is valid", %{conn: conn, attendance: %Attendance{id: id} = attendance} do
      conn = put(conn, Routes.attendance_path(conn, :update, attendance), attendance: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.attendance_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "check_in" => "some updated check_in",
               "checkout" => "some updated checkout"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, attendance: attendance} do
      conn = put(conn, Routes.attendance_path(conn, :update, attendance), attendance: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete attendance" do
    setup [:create_attendance]

    test "deletes chosen attendance", %{conn: conn, attendance: attendance} do
      conn = delete(conn, Routes.attendance_path(conn, :delete, attendance))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.attendance_path(conn, :show, attendance))
      end
    end
  end

  defp create_attendance(_) do
    attendance = attendance_fixture()
    %{attendance: attendance}
  end
end
