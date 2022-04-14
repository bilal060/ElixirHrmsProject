defmodule AuthTutorialPhoenix.AccountsTest do
  use AuthTutorialPhoenix.DataCase

  alias AuthTutorialPhoenix.Accounts

  describe "users" do
    alias AuthTutorialPhoenix.Accounts.User

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, password: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", first_name: "some first_name", last_name: "some last_name", password: "some password"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", password: "some updated password"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.password == "some updated password"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "permissions" do
    alias AuthTutorialPhoenix.Accounts.Permission

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{delete: nil, inserted_by: nil, permission_name: nil, read: nil, updated_by: nil, write: nil}

    test "list_permissions/0 returns all permissions" do
      permission = permission_fixture()
      assert Accounts.list_permissions() == [permission]
    end

    test "get_permission!/1 returns the permission with given id" do
      permission = permission_fixture()
      assert Accounts.get_permission!(permission.id) == permission
    end

    test "create_permission/1 with valid data creates a permission" do
      valid_attrs = %{delete: true, inserted_by: "some inserted_by", permission_name: "some permission_name", read: true, updated_by: "some updated_by", write: true}

      assert {:ok, %Permission{} = permission} = Accounts.create_permission(valid_attrs)
      assert permission.delete == true
      assert permission.inserted_by == "some inserted_by"
      assert permission.permission_name == "some permission_name"
      assert permission.read == true
      assert permission.updated_by == "some updated_by"
      assert permission.write == true
    end

    test "create_permission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_permission(@invalid_attrs)
    end

    test "update_permission/2 with valid data updates the permission" do
      permission = permission_fixture()
      update_attrs = %{delete: false, inserted_by: "some updated inserted_by", permission_name: "some updated permission_name", read: false, updated_by: "some updated updated_by", write: false}

      assert {:ok, %Permission{} = permission} = Accounts.update_permission(permission, update_attrs)
      assert permission.delete == false
      assert permission.inserted_by == "some updated inserted_by"
      assert permission.permission_name == "some updated permission_name"
      assert permission.read == false
      assert permission.updated_by == "some updated updated_by"
      assert permission.write == false
    end

    test "update_permission/2 with invalid data returns error changeset" do
      permission = permission_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_permission(permission, @invalid_attrs)
      assert permission == Accounts.get_permission!(permission.id)
    end

    test "delete_permission/1 deletes the permission" do
      permission = permission_fixture()
      assert {:ok, %Permission{}} = Accounts.delete_permission(permission)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_permission!(permission.id) end
    end

    test "change_permission/1 returns a permission changeset" do
      permission = permission_fixture()
      assert %Ecto.Changeset{} = Accounts.change_permission(permission)
    end
  end

  describe "profiles" do
    alias AuthTutorialPhoenix.Accounts.Profile

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{cnic: nil, company_id: nil, first_name: nil, last_name: nil, username: nil}

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Accounts.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Accounts.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      valid_attrs = %{cnic: 42, company_id: 42, first_name: "some first_name", last_name: "some last_name", username: "some username"}

      assert {:ok, %Profile{} = profile} = Accounts.create_profile(valid_attrs)
      assert profile.cnic == 42
      assert profile.company_id == 42
      assert profile.first_name == "some first_name"
      assert profile.last_name == "some last_name"
      assert profile.username == "some username"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      update_attrs = %{cnic: 43, company_id: 43, first_name: "some updated first_name", last_name: "some updated last_name", username: "some updated username"}

      assert {:ok, %Profile{} = profile} = Accounts.update_profile(profile, update_attrs)
      assert profile.cnic == 43
      assert profile.company_id == 43
      assert profile.first_name == "some updated first_name"
      assert profile.last_name == "some updated last_name"
      assert profile.username == "some updated username"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_profile(profile, @invalid_attrs)
      assert profile == Accounts.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Accounts.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Accounts.change_profile(profile)
    end
  end

  describe "companies" do
    alias AuthTutorialPhoenix.Accounts.Company

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{company_name: nil}

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Accounts.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Accounts.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      valid_attrs = %{company_name: "some company_name"}

      assert {:ok, %Company{} = company} = Accounts.create_company(valid_attrs)
      assert company.company_name == "some company_name"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      update_attrs = %{company_name: "some updated company_name"}

      assert {:ok, %Company{} = company} = Accounts.update_company(company, update_attrs)
      assert company.company_name == "some updated company_name"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_company(company, @invalid_attrs)
      assert company == Accounts.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Accounts.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Accounts.change_company(company)
    end
  end

  describe "employees" do
    alias AuthTutorialPhoenix.Accounts.Employee

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{employee_id: nil, join_date: nil, role: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Accounts.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Accounts.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{employee_id: "some employee_id", join_date: "some join_date", role: "some role"}

      assert {:ok, %Employee{} = employee} = Accounts.create_employee(valid_attrs)
      assert employee.employee_id == "some employee_id"
      assert employee.join_date == "some join_date"
      assert employee.role == "some role"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{employee_id: "some updated employee_id", join_date: "some updated join_date", role: "some updated role"}

      assert {:ok, %Employee{} = employee} = Accounts.update_employee(employee, update_attrs)
      assert employee.employee_id == "some updated employee_id"
      assert employee.join_date == "some updated join_date"
      assert employee.role == "some updated role"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_employee(employee, @invalid_attrs)
      assert employee == Accounts.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Accounts.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Accounts.change_employee(employee)
    end
  end

  describe "employees" do
    alias AuthTutorialPhoenix.Accounts.Employee

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{email: nil, employee_id: nil, gender: nil, join_date: nil, role: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Accounts.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Accounts.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{email: "some email", employee_id: "some employee_id", gender: "some gender", join_date: "some join_date", role: "some role"}

      assert {:ok, %Employee{} = employee} = Accounts.create_employee(valid_attrs)
      assert employee.email == "some email"
      assert employee.employee_id == "some employee_id"
      assert employee.gender == "some gender"
      assert employee.join_date == "some join_date"
      assert employee.role == "some role"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{email: "some updated email", employee_id: "some updated employee_id", gender: "some updated gender", join_date: "some updated join_date", role: "some updated role"}

      assert {:ok, %Employee{} = employee} = Accounts.update_employee(employee, update_attrs)
      assert employee.email == "some updated email"
      assert employee.employee_id == "some updated employee_id"
      assert employee.gender == "some updated gender"
      assert employee.join_date == "some updated join_date"
      assert employee.role == "some updated role"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_employee(employee, @invalid_attrs)
      assert employee == Accounts.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Accounts.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Accounts.change_employee(employee)
    end
  end

  describe "employees" do
    alias AuthTutorialPhoenix.Accounts.Employee

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{email: nil, employee_id: nil, gender: nil, join_date: nil, name: nil, role: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Accounts.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Accounts.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{email: "some email", employee_id: "some employee_id", gender: "some gender", join_date: "some join_date", name: "some name", role: "some role"}

      assert {:ok, %Employee{} = employee} = Accounts.create_employee(valid_attrs)
      assert employee.email == "some email"
      assert employee.employee_id == "some employee_id"
      assert employee.gender == "some gender"
      assert employee.join_date == "some join_date"
      assert employee.name == "some name"
      assert employee.role == "some role"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{email: "some updated email", employee_id: "some updated employee_id", gender: "some updated gender", join_date: "some updated join_date", name: "some updated name", role: "some updated role"}

      assert {:ok, %Employee{} = employee} = Accounts.update_employee(employee, update_attrs)
      assert employee.email == "some updated email"
      assert employee.employee_id == "some updated employee_id"
      assert employee.gender == "some updated gender"
      assert employee.join_date == "some updated join_date"
      assert employee.name == "some updated name"
      assert employee.role == "some updated role"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_employee(employee, @invalid_attrs)
      assert employee == Accounts.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Accounts.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Accounts.change_employee(employee)
    end
  end

  describe "salaries" do
    alias AuthTutorialPhoenix.Accounts.Salary

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{sal_type: nil, salary: nil, status: nil}

    test "list_salaries/0 returns all salaries" do
      salary = salary_fixture()
      assert Accounts.list_salaries() == [salary]
    end

    test "get_salary!/1 returns the salary with given id" do
      salary = salary_fixture()
      assert Accounts.get_salary!(salary.id) == salary
    end

    test "create_salary/1 with valid data creates a salary" do
      valid_attrs = %{sal_type: "some sal_type", salary: 42, status: "some status"}

      assert {:ok, %Salary{} = salary} = Accounts.create_salary(valid_attrs)
      assert salary.sal_type == "some sal_type"
      assert salary.salary == 42
      assert salary.status == "some status"
    end

    test "create_salary/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_salary(@invalid_attrs)
    end

    test "update_salary/2 with valid data updates the salary" do
      salary = salary_fixture()
      update_attrs = %{sal_type: "some updated sal_type", salary: 43, status: "some updated status"}

      assert {:ok, %Salary{} = salary} = Accounts.update_salary(salary, update_attrs)
      assert salary.sal_type == "some updated sal_type"
      assert salary.salary == 43
      assert salary.status == "some updated status"
    end

    test "update_salary/2 with invalid data returns error changeset" do
      salary = salary_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_salary(salary, @invalid_attrs)
      assert salary == Accounts.get_salary!(salary.id)
    end

    test "delete_salary/1 deletes the salary" do
      salary = salary_fixture()
      assert {:ok, %Salary{}} = Accounts.delete_salary(salary)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_salary!(salary.id) end
    end

    test "change_salary/1 returns a salary changeset" do
      salary = salary_fixture()
      assert %Ecto.Changeset{} = Accounts.change_salary(salary)
    end
  end

  describe "clients" do
    alias AuthTutorialPhoenix.Accounts.Client

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{address: nil, name: nil, phone: nil}

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Accounts.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Accounts.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      valid_attrs = %{address: "some address", name: "some name", phone: 42}

      assert {:ok, %Client{} = client} = Accounts.create_client(valid_attrs)
      assert client.address == "some address"
      assert client.name == "some name"
      assert client.phone == 42
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      update_attrs = %{address: "some updated address", name: "some updated name", phone: 43}

      assert {:ok, %Client{} = client} = Accounts.update_client(client, update_attrs)
      assert client.address == "some updated address"
      assert client.name == "some updated name"
      assert client.phone == 43
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_client(client, @invalid_attrs)
      assert client == Accounts.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Accounts.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Accounts.change_client(client)
    end
  end

  describe "projects" do
    alias AuthTutorialPhoenix.Accounts.Project

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{project_amount: nil, project_name: nil, start_date: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Accounts.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Accounts.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{project_amount: 42, project_name: "some project_name", start_date: "some start_date"}

      assert {:ok, %Project{} = project} = Accounts.create_project(valid_attrs)
      assert project.project_amount == 42
      assert project.project_name == "some project_name"
      assert project.start_date == "some start_date"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{project_amount: 43, project_name: "some updated project_name", start_date: "some updated start_date"}

      assert {:ok, %Project{} = project} = Accounts.update_project(project, update_attrs)
      assert project.project_amount == 43
      assert project.project_name == "some updated project_name"
      assert project.start_date == "some updated start_date"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_project(project, @invalid_attrs)
      assert project == Accounts.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Accounts.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Accounts.change_project(project)
    end
  end

  describe "payments" do
    alias AuthTutorialPhoenix.Accounts.Payment

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{amount: nil, payment_id: nil, payment_type: nil}

    test "list_payments/0 returns all payments" do
      payment = payment_fixture()
      assert Accounts.list_payments() == [payment]
    end

    test "get_payment!/1 returns the payment with given id" do
      payment = payment_fixture()
      assert Accounts.get_payment!(payment.id) == payment
    end

    test "create_payment/1 with valid data creates a payment" do
      valid_attrs = %{amount: 42, payment_id: "some payment_id", payment_type: "some payment_type"}

      assert {:ok, %Payment{} = payment} = Accounts.create_payment(valid_attrs)
      assert payment.amount == 42
      assert payment.payment_id == "some payment_id"
      assert payment.payment_type == "some payment_type"
    end

    test "create_payment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_payment(@invalid_attrs)
    end

    test "update_payment/2 with valid data updates the payment" do
      payment = payment_fixture()
      update_attrs = %{amount: 43, payment_id: "some updated payment_id", payment_type: "some updated payment_type"}

      assert {:ok, %Payment{} = payment} = Accounts.update_payment(payment, update_attrs)
      assert payment.amount == 43
      assert payment.payment_id == "some updated payment_id"
      assert payment.payment_type == "some updated payment_type"
    end

    test "update_payment/2 with invalid data returns error changeset" do
      payment = payment_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_payment(payment, @invalid_attrs)
      assert payment == Accounts.get_payment!(payment.id)
    end

    test "delete_payment/1 deletes the payment" do
      payment = payment_fixture()
      assert {:ok, %Payment{}} = Accounts.delete_payment(payment)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_payment!(payment.id) end
    end

    test "change_payment/1 returns a payment changeset" do
      payment = payment_fixture()
      assert %Ecto.Changeset{} = Accounts.change_payment(payment)
    end
  end

  describe "expenses" do
    alias AuthTutorialPhoenix.Accounts.Expense

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{amount: nil, date: nil, expense_id: nil, from: nil, item: nil, paid_by: nil, status: nil}

    test "list_expenses/0 returns all expenses" do
      expense = expense_fixture()
      assert Accounts.list_expenses() == [expense]
    end

    test "get_expense!/1 returns the expense with given id" do
      expense = expense_fixture()
      assert Accounts.get_expense!(expense.id) == expense
    end

    test "create_expense/1 with valid data creates a expense" do
      valid_attrs = %{amount: 42, date: "some date", expense_id: "some expense_id", from: "some from", item: "some item", paid_by: "some paid_by", status: "some status"}

      assert {:ok, %Expense{} = expense} = Accounts.create_expense(valid_attrs)
      assert expense.amount == 42
      assert expense.date == "some date"
      assert expense.expense_id == "some expense_id"
      assert expense.from == "some from"
      assert expense.item == "some item"
      assert expense.paid_by == "some paid_by"
      assert expense.status == "some status"
    end

    test "create_expense/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_expense(@invalid_attrs)
    end

    test "update_expense/2 with valid data updates the expense" do
      expense = expense_fixture()
      update_attrs = %{amount: 43, date: "some updated date", expense_id: "some updated expense_id", from: "some updated from", item: "some updated item", paid_by: "some updated paid_by", status: "some updated status"}

      assert {:ok, %Expense{} = expense} = Accounts.update_expense(expense, update_attrs)
      assert expense.amount == 43
      assert expense.date == "some updated date"
      assert expense.expense_id == "some updated expense_id"
      assert expense.from == "some updated from"
      assert expense.item == "some updated item"
      assert expense.paid_by == "some updated paid_by"
      assert expense.status == "some updated status"
    end

    test "update_expense/2 with invalid data returns error changeset" do
      expense = expense_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_expense(expense, @invalid_attrs)
      assert expense == Accounts.get_expense!(expense.id)
    end

    test "delete_expense/1 deletes the expense" do
      expense = expense_fixture()
      assert {:ok, %Expense{}} = Accounts.delete_expense(expense)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_expense!(expense.id) end
    end

    test "change_expense/1 returns a expense changeset" do
      expense = expense_fixture()
      assert %Ecto.Changeset{} = Accounts.change_expense(expense)
    end
  end

  describe "departments" do
    alias AuthTutorialPhoenix.Accounts.Department

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{department_head: nil, department_name: nil, no_of_employees: nil}

    test "list_departments/0 returns all departments" do
      department = department_fixture()
      assert Accounts.list_departments() == [department]
    end

    test "get_department!/1 returns the department with given id" do
      department = department_fixture()
      assert Accounts.get_department!(department.id) == department
    end

    test "create_department/1 with valid data creates a department" do
      valid_attrs = %{department_head: "some department_head", department_name: "some department_name", no_of_employees: 42}

      assert {:ok, %Department{} = department} = Accounts.create_department(valid_attrs)
      assert department.department_head == "some department_head"
      assert department.department_name == "some department_name"
      assert department.no_of_employees == 42
    end

    test "create_department/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_department(@invalid_attrs)
    end

    test "update_department/2 with valid data updates the department" do
      department = department_fixture()
      update_attrs = %{department_head: "some updated department_head", department_name: "some updated department_name", no_of_employees: 43}

      assert {:ok, %Department{} = department} = Accounts.update_department(department, update_attrs)
      assert department.department_head == "some updated department_head"
      assert department.department_name == "some updated department_name"
      assert department.no_of_employees == 43
    end

    test "update_department/2 with invalid data returns error changeset" do
      department = department_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_department(department, @invalid_attrs)
      assert department == Accounts.get_department!(department.id)
    end

    test "delete_department/1 deletes the department" do
      department = department_fixture()
      assert {:ok, %Department{}} = Accounts.delete_department(department)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_department!(department.id) end
    end

    test "change_department/1 returns a department changeset" do
      department = department_fixture()
      assert %Ecto.Changeset{} = Accounts.change_department(department)
    end
  end

  describe "leaves" do
    alias AuthTutorialPhoenix.Accounts.Leave

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{end_date: nil, leave_type: nil, reason: nil, start_date: nil}

    test "list_leaves/0 returns all leaves" do
      leave = leave_fixture()
      assert Accounts.list_leaves() == [leave]
    end

    test "get_leave!/1 returns the leave with given id" do
      leave = leave_fixture()
      assert Accounts.get_leave!(leave.id) == leave
    end

    test "create_leave/1 with valid data creates a leave" do
      valid_attrs = %{end_date: "some end_date", leave_type: "some leave_type", reason: "some reason", start_date: "some start_date"}

      assert {:ok, %Leave{} = leave} = Accounts.create_leave(valid_attrs)
      assert leave.end_date == "some end_date"
      assert leave.leave_type == "some leave_type"
      assert leave.reason == "some reason"
      assert leave.start_date == "some start_date"
    end

    test "create_leave/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_leave(@invalid_attrs)
    end

    test "update_leave/2 with valid data updates the leave" do
      leave = leave_fixture()
      update_attrs = %{end_date: "some updated end_date", leave_type: "some updated leave_type", reason: "some updated reason", start_date: "some updated start_date"}

      assert {:ok, %Leave{} = leave} = Accounts.update_leave(leave, update_attrs)
      assert leave.end_date == "some updated end_date"
      assert leave.leave_type == "some updated leave_type"
      assert leave.reason == "some updated reason"
      assert leave.start_date == "some updated start_date"
    end

    test "update_leave/2 with invalid data returns error changeset" do
      leave = leave_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_leave(leave, @invalid_attrs)
      assert leave == Accounts.get_leave!(leave.id)
    end

    test "delete_leave/1 deletes the leave" do
      leave = leave_fixture()
      assert {:ok, %Leave{}} = Accounts.delete_leave(leave)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_leave!(leave.id) end
    end

    test "change_leave/1 returns a leave changeset" do
      leave = leave_fixture()
      assert %Ecto.Changeset{} = Accounts.change_leave(leave)
    end
  end

  describe "invoices" do
    alias AuthTutorialPhoenix.Accounts.Invoice

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{amount: nil, clients: nil, date: nil, invoice_no: nil, status: nil, type: nil}

    test "list_invoices/0 returns all invoices" do
      invoice = invoice_fixture()
      assert Accounts.list_invoices() == [invoice]
    end

    test "get_invoice!/1 returns the invoice with given id" do
      invoice = invoice_fixture()
      assert Accounts.get_invoice!(invoice.id) == invoice
    end

    test "create_invoice/1 with valid data creates a invoice" do
      valid_attrs = %{amount: 42, clients: "some clients", date: "some date", invoice_no: "some invoice_no", status: "some status", type: "some type"}

      assert {:ok, %Invoice{} = invoice} = Accounts.create_invoice(valid_attrs)
      assert invoice.amount == 42
      assert invoice.clients == "some clients"
      assert invoice.date == "some date"
      assert invoice.invoice_no == "some invoice_no"
      assert invoice.status == "some status"
      assert invoice.type == "some type"
    end

    test "create_invoice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_invoice(@invalid_attrs)
    end

    test "update_invoice/2 with valid data updates the invoice" do
      invoice = invoice_fixture()
      update_attrs = %{amount: 43, clients: "some updated clients", date: "some updated date", invoice_no: "some updated invoice_no", status: "some updated status", type: "some updated type"}

      assert {:ok, %Invoice{} = invoice} = Accounts.update_invoice(invoice, update_attrs)
      assert invoice.amount == 43
      assert invoice.clients == "some updated clients"
      assert invoice.date == "some updated date"
      assert invoice.invoice_no == "some updated invoice_no"
      assert invoice.status == "some updated status"
      assert invoice.type == "some updated type"
    end

    test "update_invoice/2 with invalid data returns error changeset" do
      invoice = invoice_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_invoice(invoice, @invalid_attrs)
      assert invoice == Accounts.get_invoice!(invoice.id)
    end

    test "delete_invoice/1 deletes the invoice" do
      invoice = invoice_fixture()
      assert {:ok, %Invoice{}} = Accounts.delete_invoice(invoice)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_invoice!(invoice.id) end
    end

    test "change_invoice/1 returns a invoice changeset" do
      invoice = invoice_fixture()
      assert %Ecto.Changeset{} = Accounts.change_invoice(invoice)
    end
  end

  describe "interviews" do
    alias AuthTutorialPhoenix.Accounts.Interview

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{current_salary: nil, email: nil, expected_salary: nil, interview_date: nil, name: nil, phone: nil}

    test "list_interviews/0 returns all interviews" do
      interview = interview_fixture()
      assert Accounts.list_interviews() == [interview]
    end

    test "get_interview!/1 returns the interview with given id" do
      interview = interview_fixture()
      assert Accounts.get_interview!(interview.id) == interview
    end

    test "create_interview/1 with valid data creates a interview" do
      valid_attrs = %{current_salary: 42, email: "some email", expected_salary: 42, interview_date: "some interview_date", name: "some name", phone: "some phone"}

      assert {:ok, %Interview{} = interview} = Accounts.create_interview(valid_attrs)
      assert interview.current_salary == 42
      assert interview.email == "some email"
      assert interview.expected_salary == 42
      assert interview.interview_date == "some interview_date"
      assert interview.name == "some name"
      assert interview.phone == "some phone"
    end

    test "create_interview/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_interview(@invalid_attrs)
    end

    test "update_interview/2 with valid data updates the interview" do
      interview = interview_fixture()
      update_attrs = %{current_salary: 43, email: "some updated email", expected_salary: 43, interview_date: "some updated interview_date", name: "some updated name", phone: "some updated phone"}

      assert {:ok, %Interview{} = interview} = Accounts.update_interview(interview, update_attrs)
      assert interview.current_salary == 43
      assert interview.email == "some updated email"
      assert interview.expected_salary == 43
      assert interview.interview_date == "some updated interview_date"
      assert interview.name == "some updated name"
      assert interview.phone == "some updated phone"
    end

    test "update_interview/2 with invalid data returns error changeset" do
      interview = interview_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_interview(interview, @invalid_attrs)
      assert interview == Accounts.get_interview!(interview.id)
    end

    test "delete_interview/1 deletes the interview" do
      interview = interview_fixture()
      assert {:ok, %Interview{}} = Accounts.delete_interview(interview)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_interview!(interview.id) end
    end

    test "change_interview/1 returns a interview changeset" do
      interview = interview_fixture()
      assert %Ecto.Changeset{} = Accounts.change_interview(interview)
    end
  end

  describe "images" do
    alias AuthTutorialPhoenix.Accounts.Image

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{content_type: nil, filename: nil, path: nil}

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Accounts.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Accounts.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      valid_attrs = %{content_type: "some content_type", filename: "some filename", path: "some path"}

      assert {:ok, %Image{} = image} = Accounts.create_image(valid_attrs)
      assert image.content_type == "some content_type"
      assert image.filename == "some filename"
      assert image.path == "some path"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      update_attrs = %{content_type: "some updated content_type", filename: "some updated filename", path: "some updated path"}

      assert {:ok, %Image{} = image} = Accounts.update_image(image, update_attrs)
      assert image.content_type == "some updated content_type"
      assert image.filename == "some updated filename"
      assert image.path == "some updated path"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_image(image, @invalid_attrs)
      assert image == Accounts.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Accounts.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Accounts.change_image(image)
    end
  end

  describe "attendances" do
    alias AuthTutorialPhoenix.Accounts.Attendance

    import AuthTutorialPhoenix.AccountsFixtures

    @invalid_attrs %{check_in: nil, checkout: nil}

    test "list_attendances/0 returns all attendances" do
      attendance = attendance_fixture()
      assert Accounts.list_attendances() == [attendance]
    end

    test "get_attendance!/1 returns the attendance with given id" do
      attendance = attendance_fixture()
      assert Accounts.get_attendance!(attendance.id) == attendance
    end

    test "create_attendance/1 with valid data creates a attendance" do
      valid_attrs = %{check_in: "some check_in", checkout: "some checkout"}

      assert {:ok, %Attendance{} = attendance} = Accounts.create_attendance(valid_attrs)
      assert attendance.check_in == "some check_in"
      assert attendance.checkout == "some checkout"
    end

    test "create_attendance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_attendance(@invalid_attrs)
    end

    test "update_attendance/2 with valid data updates the attendance" do
      attendance = attendance_fixture()
      update_attrs = %{check_in: "some updated check_in", checkout: "some updated checkout"}

      assert {:ok, %Attendance{} = attendance} = Accounts.update_attendance(attendance, update_attrs)
      assert attendance.check_in == "some updated check_in"
      assert attendance.checkout == "some updated checkout"
    end

    test "update_attendance/2 with invalid data returns error changeset" do
      attendance = attendance_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_attendance(attendance, @invalid_attrs)
      assert attendance == Accounts.get_attendance!(attendance.id)
    end

    test "delete_attendance/1 deletes the attendance" do
      attendance = attendance_fixture()
      assert {:ok, %Attendance{}} = Accounts.delete_attendance(attendance)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_attendance!(attendance.id) end
    end

    test "change_attendance/1 returns a attendance changeset" do
      attendance = attendance_fixture()
      assert %Ecto.Changeset{} = Accounts.change_attendance(attendance)
    end
  end
end
