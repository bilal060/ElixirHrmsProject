defmodule AuthTutorialPhoenix.Repo.Migrations.CreatePermissions do
  use Ecto.Migration

  def change do
    create table(:permissions, primary_key: false ) do
      add :id, :uuid, primary_key: true
      add :permission_name, :string
      add :write, :boolean, default: false, null: false
      add :read, :boolean, default: false, null: false
      add :delete, :boolean, default: false, null: false
      add :inserted_by, :string
      add :updated_by, :string
      add :user_id,  references(:users, on_delete: :nothing, type: :uuid, on_delete: :delete_all)

      timestamps()
    end
  end
end
