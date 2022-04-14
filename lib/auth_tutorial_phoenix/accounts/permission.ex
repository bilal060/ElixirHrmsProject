defmodule AuthTutorialPhoenix.Accounts.Permission do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}

  schema "permissions" do
    field :delete, :boolean, default: false
    field :inserted_by, :string
    field :permission_name, :string
    field :read, :boolean, default: false
    field :updated_by, :string
    field :write, :boolean, default: false
    field :user_id, :binary_id, type: :uuid
    belongs_to :users, AuthTutorialPhoenix.Accounts.User, define_field: false, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(permission, attrs) do
    permission
    |> cast(attrs, [:permission_name, :write, :read, :delete, :inserted_by, :updated_by, :user_id])
    |> validate_required([:permission_name])
  end
end
