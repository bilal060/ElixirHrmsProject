defmodule AuthTutorialPhoenixWeb.ExpenseController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Expense

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    expenses = Accounts.list_expenses()
    render(conn, "index.json", expenses: expenses)
  end

  def create(conn, %{"expense" => expense_params}) do
    with {:ok, %Expense{} = expense} <- Accounts.create_expense(expense_params) do
      employee = Accounts.get_employee!(expense_params["employee_id"])
      employee1 = %{}
      Accounts.update_employee(employee, Map.put(employee1, :expense_id, expense.id))

      conn
      |> put_status(:created)
      |> render("show1.json", expense: expense)
    end
  end

  def show(conn, %{"id" => id}) do
    expense = Accounts.get_expense!(id)
    render(conn, "show.json", expense: expense)
  end

  def update(conn, %{"id" => id, "expense" => expense_params}) do
    expense = Accounts.get_expense!(id)

    with {:ok, %Expense{} = expense} <- Accounts.update_expense(expense, expense_params) do
      render(conn, "show.json", expense: expense)
    end
  end

  def delete(conn, %{"id" => id}) do
    expense = Accounts.get_expense!(id)

    with {:ok, %Expense{}} <- Accounts.delete_expense(expense) do
      send_resp(conn, :no_content, "")
    end
  end
end
