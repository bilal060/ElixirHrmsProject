defmodule AuthTutorialPhoenix.Accounts.Leave do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "leaves" do
    field :end_date, :string
    field :leave_type, :string
    field :reason, :string
    field :start_date, :string
    field :employee_id, :binary_id, type: :uuid
    belongs_to :employees, AuthTutorialPhoenix.Accounts.Employee, define_field: false, foreign_key: :employee_id


    # has_one :employees, AuthTutorialPhoenix.Accounts.Employee, foreign_key: :employee_id, on_delete: :delete_all
    # field :employee_id, :binary_id, type: :uuid
    # belongs_to :employee, AuthTutorialPhoenix.Accounts.Employee, define_field: false
    # belongs_to :employee, AuthTutorialPhoenix.Accounts.Employee, define_field: false

    timestamps()
  end

  @doc false
  def changeset(leave, attrs) do
    leave
    |> cast(attrs, [:leave_type, :start_date, :end_date, :reason, :employee_id])
    |> validate_required([:leave_type, :start_date, :end_date, :reason])
  end
end
