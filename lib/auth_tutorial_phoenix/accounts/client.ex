defmodule AuthTutorialPhoenix.Accounts.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "clients" do
    field :email, :string
    field :name, :string
    field :phone, :integer
    field :project_name, :string
    field :start_date, :string
    field :payment_id, :binary_id, type: :uuid
    has_many :invoices, AuthTutorialPhoenix.Accounts.Invoice, foreign_key: :client_id, on_delete: :delete_all
    has_many :payments, AuthTutorialPhoenix.Accounts.Payment, foreign_key: :client_id, on_delete: :delete_all

    timestamps()
  end
  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :phone, :email, :project_name, :start_date, :payment_id])
    |> validate_required([:name, :phone, :email])
  end
end
