defmodule AuthTutorialPhoenixWeb.EmployeeView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.EmployeeView

  def render("index.json", %{employees: employees}) do
    %{title: "Helllo",
      data: render_many(employees, EmployeeView, "employee.json")}
  end

  def render("show.json", %{employee: employee}) do
    %{data: render_one(employee, EmployeeView, "employee1.json")}
  end

  def render("show1.json", %{employee: employee}) do
    %{data: render_one(employee, EmployeeView, "employee.json")}
  end


  def render("employee.json", %{employee: employee}) do
    %{
      id: employee.id,
      role: employee.role,
      join_date: employee.join_date,
      email: employee.email,
      gender: employee.gender,
      name: employee.name,
      phoneNo: employee.phoneNo,
      # expense: render_many(employee.expenses, __MODULE__, "expense.json", as: :expense),
    }
  end
  def render("employee1.json", %{employee: employee}) do
    IO.puts "Hello World"
    IO.inspect(employee)
    %{
      id: employee.id,
      employee_id: employee.employee_id,
      role: employee.role,
      join_date: employee.join_date,
      email: employee.email,
      gender: employee.gender,
      name: employee.name,
      phoneNo: employee.phoneNo,
    }
  end

  def render("showID.json", %{employee: employee}) do
    %{
      employee: employee.id,
    }
  end
  # def render("expense.json", %{expense: expense}) do
  #   %{
  #     id: expense.id,
  #     exp_id: expense.exp_id,
  #     item: expense.item,
  #     from: expense.from,
  #     date: expense.date,
  #     paid_by: expense.paid_by,
  #     status: expense.status,
  #     amount: expense.amount,
  #   }
  # end
end
