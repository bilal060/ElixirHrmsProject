defmodule AuthTutorialPhoenix.Accounts.Department do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "departments" do
    field :department_head, :string
    field :department_name, :string
    field :no_of_employees, :string

    timestamps()
  end

  @doc false
  def changeset(department, attrs) do
    department
    |> cast(attrs, [:department_name, :department_head, :no_of_employees])
    |> validate_required([:department_name, :department_head, :no_of_employees])
  end
end
