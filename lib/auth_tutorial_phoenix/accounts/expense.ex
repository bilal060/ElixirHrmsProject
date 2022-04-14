defmodule AuthTutorialPhoenix.Accounts.Expense do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "expenses" do
    field :amount, :integer
    field :date, :string
    field :from, :string
    field :item, :string
    field :paid_by, :string
    field :status, :string
    field :employee_id, :binary_id, type: :uuid
    belongs_to :employees, AuthTutorialPhoenix.Accounts.Employee, define_field: false, foreign_key: :employee_id

    timestamps()
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:item, :from, :date, :paid_by, :status, :amount, :employee_id])
    |> validate_required([:item, :from, :date, :paid_by, :status, :amount])
  end
end
