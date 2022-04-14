defmodule AuthTutorialPhoenixWeb.SalaryController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Salary

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    salaries = Accounts.list_salaries()
    render(conn, "index.json", salaries: salaries)
  end

  def create(conn, %{"salary" => salary_params}) do
    with {:ok, %Salary{} = salary} <- Accounts.create_salary(salary_params) do
      employee = Accounts.get_employee!(salary_params["employee_id"])
        employee1 = %{}
        Accounts.update_employee(employee, Map.put(employee1, :salary_id, salary.id))
      conn
      |> put_status(:created)
      |> render("show1.json", salary: salary)
    end
  end

  def show(conn, %{"id" => id}) do
    salary = Accounts.get_salary!(id)
    render(conn, "show.json", salary: salary)
  end

  def update(conn, %{"id" => id, "salary" => salary_params}) do
    salary = Accounts.get_salary!(id)

    with {:ok, %Salary{} = salary} <- Accounts.update_salary(salary, salary_params) do
      render(conn, "show.json", salary: salary)
    end
  end

  def delete(conn, %{"id" => id}) do
    salary = Accounts.get_salary!(id)

    with {:ok, %Salary{}} <- Accounts.delete_salary(salary) do
      send_resp(conn, :no_content, "")
    end
  end
end
