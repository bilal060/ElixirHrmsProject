defmodule AuthTutorialPhoenix.Accounts.Attendance do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "attendances" do
    field :check_in, :string
    field :status, :string
    field :check_out, :string
    field :employee_id, :binary_id, type: :uuid
    field :date, :string
    belongs_to :employees, AuthTutorialPhoenix.Accounts.Employee, define_field: false, foreign_key: :employee_id


    timestamps()
  end

  @doc false
  def changeset(attendance, attrs) do
    attendance
    |> cast(attrs, [:check_in, :check_out, :employee_id, :status, :date])
    |> validate_required([:date])
  end
end
