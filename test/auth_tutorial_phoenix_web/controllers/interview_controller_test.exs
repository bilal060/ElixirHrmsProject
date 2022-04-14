defmodule AuthTutorialPhoenixWeb.InterviewControllerTest do
  use AuthTutorialPhoenixWeb.ConnCase

  import AuthTutorialPhoenix.AccountsFixtures

  alias AuthTutorialPhoenix.Accounts.Interview

  @create_attrs %{
    current_salary: 42,
    email: "some email",
    expected_salary: 42,
    interview_date: "some interview_date",
    name: "some name",
    phone: "some phone"
  }
  @update_attrs %{
    current_salary: 43,
    email: "some updated email",
    expected_salary: 43,
    interview_date: "some updated interview_date",
    name: "some updated name",
    phone: "some updated phone"
  }
  @invalid_attrs %{current_salary: nil, email: nil, expected_salary: nil, interview_date: nil, name: nil, phone: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all interviews", %{conn: conn} do
      conn = get(conn, Routes.interview_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create interview" do
    test "renders interview when data is valid", %{conn: conn} do
      conn = post(conn, Routes.interview_path(conn, :create), interview: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.interview_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "current_salary" => 42,
               "email" => "some email",
               "expected_salary" => 42,
               "interview_date" => "some interview_date",
               "name" => "some name",
               "phone" => "some phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.interview_path(conn, :create), interview: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update interview" do
    setup [:create_interview]

    test "renders interview when data is valid", %{conn: conn, interview: %Interview{id: id} = interview} do
      conn = put(conn, Routes.interview_path(conn, :update, interview), interview: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.interview_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "current_salary" => 43,
               "email" => "some updated email",
               "expected_salary" => 43,
               "interview_date" => "some updated interview_date",
               "name" => "some updated name",
               "phone" => "some updated phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, interview: interview} do
      conn = put(conn, Routes.interview_path(conn, :update, interview), interview: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete interview" do
    setup [:create_interview]

    test "deletes chosen interview", %{conn: conn, interview: interview} do
      conn = delete(conn, Routes.interview_path(conn, :delete, interview))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.interview_path(conn, :show, interview))
      end
    end
  end

  defp create_interview(_) do
    interview = interview_fixture()
    %{interview: interview}
  end
end
