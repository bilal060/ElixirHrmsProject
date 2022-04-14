defmodule AuthTutorialPhoenixWeb.AttendanceController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Attendance

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    attendances = Accounts.list_attendances()
    render(conn, "index.json", attendances: attendances)
  end

  def create(conn, %{"attendance" => attendance_params}) do
    with {:ok, %Attendance{} = attendance} <- Accounts.create_attendance(attendance_params) do
      conn
      |> put_status(:created)
      |> render("show1.json", attendance: attendance)
    end
  end

  def show(conn, %{"id" => id}) do
    attendance = Accounts.get_attendance!(id)
    render(conn, "show.json", attendance: attendance)
  end

  def update(conn, %{"id" => id, "attendance" => attendance_params}) do
    attendance = Accounts.get_attendance!(id)

    with {:ok, %Attendance{} = attendance} <- Accounts.update_attendance(attendance, attendance_params) do
      render(conn, "show.json", attendance: attendance)
    end
  end

  def delete(conn, %{"id" => id}) do
    attendance = Accounts.get_attendance!(id)

    with {:ok, %Attendance{}} <- Accounts.delete_attendance(attendance) do
      send_resp(conn, :no_content, "")
    end
  end
end
