defmodule AuthTutorialPhoenix.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :invoice_no, :string
      add :client_id, references(:clients, on_delete: :nothing, type: :uuid, on_delete: :delete_all)
      add :date, :string
      add :type, :string
      add :status, :string
      add :amount, :integer

      timestamps()
      
    end
  end
end
