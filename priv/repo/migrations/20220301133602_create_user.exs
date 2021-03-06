defmodule AuthTutorialPhoenix.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :email, :string
      add :password, :string
      add :role, :string
      add :inserted_by, :string
      add :updated_by, :string

      timestamps()
    end
  end
end
