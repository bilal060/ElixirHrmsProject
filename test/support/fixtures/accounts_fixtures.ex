defmodule AuthTutorialPhoenix.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AuthTutorialPhoenix.Accounts` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        first_name: "some first_name",
        last_name: "some last_name",
        password: "some password"
      })
      |> AuthTutorialPhoenix.Accounts.create_user()

    user
  end

  @doc """
  Generate a permission.
  """
  def permission_fixture(attrs \\ %{}) do
    {:ok, permission} =
      attrs
      |> Enum.into(%{
        delete: true,
        inserted_by: "some inserted_by",
        permission_name: "some permission_name",
        read: true,
        updated_by: "some updated_by",
        write: true
      })
      |> AuthTutorialPhoenix.Accounts.create_permission()

    permission
  end

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{
        cnic: 42,
        company_id: 42,
        first_name: "some first_name",
        last_name: "some last_name",
        username: "some username"
      })
      |> AuthTutorialPhoenix.Accounts.create_profile()

    profile
  end

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{
        company_name: "some company_name"
      })
      |> AuthTutorialPhoenix.Accounts.create_company()

    company
  end

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        email: "some email",
        employee_id: "some employee_id",
        gender: "some gender",
        join_date: "some join_date",
        name: "some name",
        role: "some role"
      })
      |> AuthTutorialPhoenix.Accounts.create_employee()

    employee
  end

  @doc """
  Generate a salary.
  """
  def salary_fixture(attrs \\ %{}) do
    {:ok, salary} =
      attrs
      |> Enum.into(%{
        sal_type: "some sal_type",
        salary: 42,
        status: "some status"
      })
      |> AuthTutorialPhoenix.Accounts.create_salary()

    salary
  end

  @doc """
  Generate a client.
  """
  def client_fixture(attrs \\ %{}) do
    {:ok, client} =
      attrs
      |> Enum.into(%{
        address: "some address",
        name: "some name",
        phone: 42
      })
      |> AuthTutorialPhoenix.Accounts.create_client()

    client
  end

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        project_amount: 42,
        project_name: "some project_name",
        start_date: "some start_date"
      })
      |> AuthTutorialPhoenix.Accounts.create_project()

    project
  end

  @doc """
  Generate a payment.
  """
  def payment_fixture(attrs \\ %{}) do
    {:ok, payment} =
      attrs
      |> Enum.into(%{
        amount: 42,
        payment_id: "some payment_id",
        payment_type: "some payment_type"
      })
      |> AuthTutorialPhoenix.Accounts.create_payment()

    payment
  end

  @doc """
  Generate a expense.
  """
  def expense_fixture(attrs \\ %{}) do
    {:ok, expense} =
      attrs
      |> Enum.into(%{
        amount: 42,
        date: "some date",
        expense_id: "some expense_id",
        from: "some from",
        item: "some item",
        paid_by: "some paid_by",
        status: "some status"
      })
      |> AuthTutorialPhoenix.Accounts.create_expense()

    expense
  end

  @doc """
  Generate a department.
  """
  def department_fixture(attrs \\ %{}) do
    {:ok, department} =
      attrs
      |> Enum.into(%{
        department_head: "some department_head",
        department_name: "some department_name",
        no_of_employees: 42
      })
      |> AuthTutorialPhoenix.Accounts.create_department()

    department
  end

  @doc """
  Generate a leave.
  """
  def leave_fixture(attrs \\ %{}) do
    {:ok, leave} =
      attrs
      |> Enum.into(%{
        end_date: "some end_date",
        leave_type: "some leave_type",
        reason: "some reason",
        start_date: "some start_date"
      })
      |> AuthTutorialPhoenix.Accounts.create_leave()

    leave
  end

  @doc """
  Generate a invoice.
  """
  def invoice_fixture(attrs \\ %{}) do
    {:ok, invoice} =
      attrs
      |> Enum.into(%{
        amount: 42,
        clients: "some clients",
        date: "some date",
        invoice_no: "some invoice_no",
        status: "some status",
        type: "some type"
      })
      |> AuthTutorialPhoenix.Accounts.create_invoice()

    invoice
  end

  @doc """
  Generate a interview.
  """
  def interview_fixture(attrs \\ %{}) do
    {:ok, interview} =
      attrs
      |> Enum.into(%{
        current_salary: 42,
        email: "some email",
        expected_salary: 42,
        interview_date: "some interview_date",
        name: "some name",
        phone: "some phone"
      })
      |> AuthTutorialPhoenix.Accounts.create_interview()

    interview
  end

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        content_type: "some content_type",
        filename: "some filename",
        path: "some path"
      })
      |> AuthTutorialPhoenix.Accounts.create_image()

    image
  end

  @doc """
  Generate a attendance.
  """
  def attendance_fixture(attrs \\ %{}) do
    {:ok, attendance} =
      attrs
      |> Enum.into(%{
        check_in: "some check_in",
        checkout: "some checkout"
      })
      |> AuthTutorialPhoenix.Accounts.create_attendance()

    attendance
  end
end
