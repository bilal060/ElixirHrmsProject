defmodule AuthTutorialPhoenix.Accounts.Salary do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "salaries" do
    field :salary, :integer
    field :status, :string
    field :employee_id, :binary_id, type: :uuid
    belongs_to :employees, AuthTutorialPhoenix.Accounts.Employee, define_field: false, foreign_key: :employee_id
    timestamps()
  end

  @doc false
  def changeset(salary, attrs) do
    salary
    |> cast(attrs, [:salary, :status, :employee_id])
    |> validate_required([:salary, :status])
  end
end
