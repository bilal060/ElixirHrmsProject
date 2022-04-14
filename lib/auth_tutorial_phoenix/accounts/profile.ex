defmodule AuthTutorialPhoenix.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "profiles" do
    field :cnic, :integer
    field :company_id, :integer
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :user_id, :binary_id, type: :uuid

    belongs_to :users, AuthTutorialPhoenix.Accounts.User, define_field: false, foreign_key: :user_id
    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:last_name, :first_name, :username, :cnic, :company_id, :user_id])
    |> validate_required([:username, :cnic])
  end
end
