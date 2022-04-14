defmodule AuthTutorialPhoenixWeb.AttendanceView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.AttendanceView

  def render("index.json", %{attendances: attendances}) do
    %{data: render_many(attendances, AttendanceView, "attendance.json")}
  end

  def render("show.json", %{attendance: attendance}) do
    %{data: render_one(attendance, AttendanceView, "attendance.json")}
  end

  def render("show1.json", %{attendance: attendance}) do
    %{data: render_one(attendance, AttendanceView, "attendance1.json")}
  end

  def render("attendance1.json", %{attendance: attendance}) do
    %{
      id: attendance.id,
    }
  end

  def render("attendance.json", %{attendance: attendance}) do
    %{
      id: attendance.id,
      check_in: attendance.check_in,
      employee_id: attendance.employee_id,
      check_out: attendance.check_out,
      status: attendance.status,
      date: attendance.date,
      employee: render_one(attendance.employees, __MODULE__, "employee.json", as: :employee),
    }
  end
  def render("employee.json", %{employee: employee}) do
    %{
      role: employee.role,
      name: employee.name,
      id: employee.id,
    }
  end
end
