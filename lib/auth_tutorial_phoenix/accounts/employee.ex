defmodule AuthTutorialPhoenix.Accounts.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "employees" do
    field :email, :string
    field :gender, :string
    field :join_date, :string
    field :name, :string
    field :role, :string
    field :phoneNo, :string
    has_one :salaries, AuthTutorialPhoenix.Accounts.Salary, foreign_key: :employee_id, on_delete: :delete_all
    has_many :expenses, AuthTutorialPhoenix.Accounts.Expense, foreign_key: :employee_id, on_delete: :delete_all
    has_many :leaves, AuthTutorialPhoenix.Accounts.Leave, foreign_key: :employee_id, on_delete: :delete_all
    has_one :attendences, AuthTutorialPhoenix.Accounts.Attendance, foreign_key: :employee_id, on_delete: :delete_all



    timestamps()
  end
  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:role, :join_date, :email, :gender, :name, :phoneNo])
    |> validate_required([:role])
  end
end
