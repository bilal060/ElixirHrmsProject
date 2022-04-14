defmodule AuthTutorialPhoenix.Accounts.Interview do
  use Ecto.Schema
  import Ecto.Changeset

  schema "interviews" do
    field :current_salary, :integer
    field :email, :string
    field :expected_salary, :integer
    field :interview_date, :string
    field :name, :string
    field :phone, :string
    field :filepath, :string
    field :offered_salary, :integer
    field :position, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(interview, attrs) do
    interview
    |> cast(attrs, [:email, :phone, :name, :current_salary, :expected_salary, :interview_date,:filepath, :offered_salary, :position, :status])
    |> validate_required([:email, :phone, :name, :current_salary, :expected_salary, :interview_date])
  end
end
