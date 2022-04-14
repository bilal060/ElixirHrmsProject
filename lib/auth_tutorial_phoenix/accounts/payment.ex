defmodule AuthTutorialPhoenix.Accounts.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "payments" do
    field :amount, :integer
    field :client_id, :binary_id, type: :uuid
    field :type, :string
    field :date, :string
    belongs_to :clients, AuthTutorialPhoenix.Accounts.Client, define_field: false, foreign_key: :client_id

    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:client_id, :amount, :type, :date])
    |> validate_required([:amount, :type])
  end
end
