defmodule AuthTutorialPhoenixWeb.DepartmentController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Department

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    departments = Accounts.list_departments()
    render(conn, "index.json", departments: departments)
  end

  def create(conn, %{"department" => department_params}) do
    with {:ok, %Department{} = department} <- Accounts.create_department(department_params) do
      conn
      |> put_status(:created)
      |> render("show.json", department: department)
    end
  end

  def show(conn, %{"id" => id}) do
    department = Accounts.get_department!(id)
    render(conn, "show.json", department: department)
  end

  def update(conn, %{"id" => id, "department" => department_params}) do
    department = Accounts.get_department!(id)

    with {:ok, %Department{} = department} <- Accounts.update_department(department, department_params) do
      render(conn, "show.json", department: department)
    end
  end

  def delete(conn, %{"id" => id}) do
    department = Accounts.get_department!(id)

    with {:ok, %Department{}} <- Accounts.delete_department(department) do
      send_resp(conn, :no_content, "")
    end
  end
end
