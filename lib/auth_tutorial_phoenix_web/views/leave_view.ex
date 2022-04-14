defmodule AuthTutorialPhoenixWeb.LeaveView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.LeaveView

  def render("index.json", %{leaves: leaves}) do
    %{data: render_many(leaves, LeaveView, "leave.json")}
  end

  def render("show.json", %{leave: leave}) do
    %{data: render_one(leave, LeaveView, "showOne.json")}
  end

  def render("leave.json", %{leave: leave}) do
    %{
      id: leave.id,
      leave_type: leave.leave_type,
      start_date: leave.start_date,
      end_date: leave.end_date,
      reason: leave.reason,
      employee: render_one(leave.employees, __MODULE__, "employee.json", as: :employee),
    }
  end
  def render("employee.json", %{employee: employee}) do
    %{
      role: employee.role,
      name: employee.name,
      email: employee.email,
    }
  end
  def render("showOne.json", %{leave: leave}) do
    %{
      id: leave.id,
      start_date: leave.start_date,
      end_date: leave.end_date,
      reason: leave.reason,
      leave_type: leave.leave_type,
      employee_id: leave.employee_id,
    }
  end
end
