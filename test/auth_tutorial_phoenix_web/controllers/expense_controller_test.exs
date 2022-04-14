defmodule AuthTutorialPhoenixWeb.ExpenseControllerTest do
  use AuthTutorialPhoenixWeb.ConnCase

  import AuthTutorialPhoenix.AccountsFixtures

  alias AuthTutorialPhoenix.Accounts.Expense

  @create_attrs %{
    amount: 42,
    date: "some date",
    expense_id: "some expense_id",
    from: "some from",
    item: "some item",
    paid_by: "some paid_by",
    status: "some status"
  }
  @update_attrs %{
    amount: 43,
    date: "some updated date",
    expense_id: "some updated expense_id",
    from: "some updated from",
    item: "some updated item",
    paid_by: "some updated paid_by",
    status: "some updated status"
  }
  @invalid_attrs %{amount: nil, date: nil, expense_id: nil, from: nil, item: nil, paid_by: nil, status: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all expenses", %{conn: conn} do
      conn = get(conn, Routes.expense_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create expense" do
    test "renders expense when data is valid", %{conn: conn} do
      conn = post(conn, Routes.expense_path(conn, :create), expense: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.expense_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "amount" => 42,
               "date" => "some date",
               "expense_id" => "some expense_id",
               "from" => "some from",
               "item" => "some item",
               "paid_by" => "some paid_by",
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.expense_path(conn, :create), expense: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update expense" do
    setup [:create_expense]

    test "renders expense when data is valid", %{conn: conn, expense: %Expense{id: id} = expense} do
      conn = put(conn, Routes.expense_path(conn, :update, expense), expense: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.expense_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "amount" => 43,
               "date" => "some updated date",
               "expense_id" => "some updated expense_id",
               "from" => "some updated from",
               "item" => "some updated item",
               "paid_by" => "some updated paid_by",
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, expense: expense} do
      conn = put(conn, Routes.expense_path(conn, :update, expense), expense: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete expense" do
    setup [:create_expense]

    test "deletes chosen expense", %{conn: conn, expense: expense} do
      conn = delete(conn, Routes.expense_path(conn, :delete, expense))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.expense_path(conn, :show, expense))
      end
    end
  end

  defp create_expense(_) do
    expense = expense_fixture()
    %{expense: expense}
  end
end
