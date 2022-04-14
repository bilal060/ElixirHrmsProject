defmodule AuthTutorialPhoenixWeb.ExpenseView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.ExpenseView

  def render("index.json", %{expenses: expenses}) do
    %{data: render_many(expenses, ExpenseView, "expense.json")}
  end

  def render("show.json", %{expense: expense}) do
    %{data: render_one(expense, ExpenseView, "expense.json")}
  end

  def render("show1.json", %{expense: expense}) do
    %{data: render_one(expense, ExpenseView, "expense1.json")}
  end

  def render("expense1.json", %{expense: expense}) do
    %{
      id: expense.id,
    }
  end
  def render("expense.json", %{expense: expense}) do
    %{
      id: expense.id,
      item: expense.item,
      from: expense.from,
      date: expense.date,
      paid_by: expense.paid_by,
      status: expense.status,
      amount: expense.amount,
      employee: render_one(expense.employees, __MODULE__, "employee.json", as: :employee),
    }
  end
  def render("employee.json", %{employee: employee}) do
    %{
      role: employee.role,
      name: employee.name,
    }
  end
end
