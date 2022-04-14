defmodule AuthTutorialPhoenix.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :phone, :integer
      add :email, :string
      add :project_name, :string
      add :start_date, :string
      add :payment_id,  references(:payments, on_delete: :nothing, type: :uuid, on_delete: :delete_all)

       timestamps()
    end
  end
end
