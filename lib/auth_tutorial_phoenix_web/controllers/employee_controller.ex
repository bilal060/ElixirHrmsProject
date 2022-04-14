defmodule AuthTutorialPhoenixWeb.EmployeeController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Employee

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    employees = Accounts.list_employees()
    # IO.inspect(Enum.map(result, fn {k, v} -> {k, v * 2} end))
    render(conn, "index.json", employees: employees)
  end

  def create(conn, %{"employee" => employee_params}) do
    with {:ok, %Employee{} = employee} <- Accounts.create_employee(employee_params) do
      IO.inspect(employee_params)
      conn
      |> put_status(:created)
      |> render("showID.json", employee: employee)
    end
  end

  def show(conn, %{"id" => id}) do
    employee = Accounts.get_employee!(id)
    render(conn, "show1.json", employee: employee)
  end

  def update(conn, %{"id" => id, "employee" => employee_params}) do
    employee = Accounts.get_employee!(id)

    with {:ok, %Employee{} = employee} <- Accounts.update_employee(employee, employee_params) do
      render(conn, "show1.json", employee: employee)
    end
  end

  def delete(conn, %{"id" => id}) do
    employee = Accounts.get_employee!(id)

    with {:ok, %Employee{}} <- Accounts.delete_employee(employee) do
      send_resp(conn, :no_content, "")
    end
  end
end
