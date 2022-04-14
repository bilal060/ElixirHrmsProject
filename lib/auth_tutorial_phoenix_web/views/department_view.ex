defmodule AuthTutorialPhoenixWeb.DepartmentView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.DepartmentView

  def render("index.json", %{departments: departments}) do
    %{data: render_many(departments, DepartmentView, "department.json")}
  end

  def render("show.json", %{department: department}) do
    %{data: render_one(department, DepartmentView, "department.json")}
  end

  def render("department.json", %{department: department}) do
    %{
      id: department.id,
      department_name: department.department_name,
      department_head: department.department_head,
      no_of_employees: department.no_of_employees
    }
  end
end
