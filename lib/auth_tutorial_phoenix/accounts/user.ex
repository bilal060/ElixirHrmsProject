defmodule AuthTutorialPhoenix.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :email, :string
    field :password, :string
    field :role, :string
    field :inserted_by, :string
    field :updated_by, :string
    has_many :permissions, AuthTutorialPhoenix.Accounts.Permission, foreign_key: :user_id, on_delete: :delete_all
    has_one :profiles, AuthTutorialPhoenix.Accounts.Profile, foreign_key: :user_id, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :role, :inserted_by, :updated_by, :expense_id])
    |> validate_required([:email, :password])
    |> unique_constraint([:email, :cnic])
  end

  def register_changeset(user, attrs, opts \\ []) do
    user
    |> cast(attrs, [:email, :password, :role, :inserted_by, :updated_by])
    |> validate_email()
    |> validate_password(opts)

  end

  defp validate_email(changeset) do
    changeset
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> validate_length(:email, max: 160)
    |> unsafe_validate_unique(:email, AuthTutorialPhoenix.Repo)
    |> unique_constraint(:email)
  end

  defp validate_password(changeset, opts) do
    changeset
    |> validate_required([:password])
    |> validate_length(:password, min: 8, max: 72)
    |> validate_format(:password, ~r/[A-Z]/, message: "at least one upper case character")
    |> maybe_hash_password(opts)
  end

  defp maybe_hash_password(changeset, _) do
    password1 = get_change(changeset, :password)
    if password1 && changeset.valid? do
      changeset
      |> put_change(:password, Pbkdf2.hash_pwd_salt(password1))
    else
      changeset
    end
  end

end
