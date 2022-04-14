defmodule AuthTutorialPhoenix.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :amount, :integer
      add :type, :string
      add :date, :string
      add :client_id, references(:clients, on_delete: :nothing, type: :uuid, on_delete: :delete_all)
      # add :clinet_id, references(:clients, on_delete: :nothing, type: :uuid, on_delete: :delete_all)

      timestamps()
    end
  end
end
