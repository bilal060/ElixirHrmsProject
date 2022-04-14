defmodule AuthTutorialPhoenix.Accounts.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :company_name, :string

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:company_name])
    |> validate_required([:company_name])
  end
end
