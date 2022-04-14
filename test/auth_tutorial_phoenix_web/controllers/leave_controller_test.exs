defmodule AuthTutorialPhoenixWeb.LeaveControllerTest do
  use AuthTutorialPhoenixWeb.ConnCase

  import AuthTutorialPhoenix.AccountsFixtures

  alias AuthTutorialPhoenix.Accounts.Leave

  @create_attrs %{
    end_date: "some end_date",
    leave_type: "some leave_type",
    reason: "some reason",
    start_date: "some start_date"
  }
  @update_attrs %{
    end_date: "some updated end_date",
    leave_type: "some updated leave_type",
    reason: "some updated reason",
    start_date: "some updated start_date"
  }
  @invalid_attrs %{end_date: nil, leave_type: nil, reason: nil, start_date: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all leaves", %{conn: conn} do
      conn = get(conn, Routes.leave_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create leave" do
    test "renders leave when data is valid", %{conn: conn} do
      conn = post(conn, Routes.leave_path(conn, :create), leave: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.leave_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "end_date" => "some end_date",
               "leave_type" => "some leave_type",
               "reason" => "some reason",
               "start_date" => "some start_date"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.leave_path(conn, :create), leave: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update leave" do
    setup [:create_leave]

    test "renders leave when data is valid", %{conn: conn, leave: %Leave{id: id} = leave} do
      conn = put(conn, Routes.leave_path(conn, :update, leave), leave: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.leave_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "end_date" => "some updated end_date",
               "leave_type" => "some updated leave_type",
               "reason" => "some updated reason",
               "start_date" => "some updated start_date"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, leave: leave} do
      conn = put(conn, Routes.leave_path(conn, :update, leave), leave: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete leave" do
    setup [:create_leave]

    test "deletes chosen leave", %{conn: conn, leave: leave} do
      conn = delete(conn, Routes.leave_path(conn, :delete, leave))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.leave_path(conn, :show, leave))
      end
    end
  end

  defp create_leave(_) do
    leave = leave_fixture()
    %{leave: leave}
  end
end
