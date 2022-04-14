defmodule AuthTutorialPhoenix.Accounts.Invoice do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "invoices" do
    field :amount, :integer
    field :client_id, :binary_id, type: :uuid
    field :date, :string
    field :invoice_no, :string
    field :status, :string
    field :type, :string
    belongs_to :clients, AuthTutorialPhoenix.Accounts.Client, define_field: false, foreign_key: :client_id



    timestamps()
  end

  @doc false
  def changeset(invoice, attrs) do
    invoice
    |> cast(attrs, [:invoice_no, :client_id, :date, :type, :status, :amount])
    |> validate_required([:invoice_no, :date, :type, :status, :amount])
  end
end
