defmodule AuthTutorialPhoenixWeb.SalaryView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.SalaryView

  def render("index.json", %{salaries: salaries}) do
    %{data: render_many(salaries, SalaryView, "salary.json")}
  end

  def render("show.json", %{salary: salary}) do
    %{data: render_one(salary, SalaryView, "salary.json")}
  end

  def render("show1.json", %{salary: salary}) do
    %{data: render_one(salary, SalaryView, "salary1.json")}
  end
  def render("salary1.json", %{salary: salary}) do
    %{
      id: salary.id,
    }
  end

  def render("salary.json", %{salary: salary}) do
    %{
      id: salary.id,
      salary: salary.salary,
      status: salary.status,
      employee: render_one(salary.employees, __MODULE__, "employee.json", as: :employee),
    }
  end

  def render("employee.json", %{employee: employee}) do
    %{
      role: employee.role,
      name: employee.name,
      email: employee.email
    }
  end
end
