defmodule AuthTutorialPhoenix.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :last_name, :string
      add :first_name, :string
      add :phone_no, :integer
      add :username, :string
      add :cnic, :integer
      add :company_id, :integer
      add :user_id,  references(:users, on_delete: :nothing, type: :uuid, on_delete: :delete_all)

      timestamps()
    end
  end
end
