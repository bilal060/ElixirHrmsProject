defmodule AuthTutorialPhoenixWeb.LeaveController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Leave

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    leaves = Accounts.list_leaves()
    render(conn, "index.json", leaves: leaves)
  end

  def create(conn, %{"leave" => leave_params}) do

      with {:ok, %Leave{} = leave} <- Accounts.create_leave(leave_params) do
        employee = Accounts.get_employee!(leave_params["employee_id"])
        employee1 = %{}
        Accounts.update_employee(employee, Map.put(employee1, :leave_id, leave.id))
      conn
      |> put_status(:created)
      |> render("show.json", leave: leave)
    end
  end

  def show(conn, %{"id" => id}) do
    leave = Accounts.get_leave!(id)
    render(conn, "show.json", leave: leave)
  end

  def update(conn, %{"id" => id, "leave" => leave_params}) do
    leave = Accounts.get_leave!(id)

    with {:ok, %Leave{} = leave} <- Accounts.update_leave(leave, leave_params) do
      render(conn, "show.json", leave: leave)
    end
  end

  def delete(conn, %{"id" => id}) do
    leave = Accounts.get_leave!(id)

    with {:ok, %Leave{}} <- Accounts.delete_leave(leave) do
      send_resp(conn, :no_content, "")
    end
  end
end
