defmodule AuthTutorialPhoenix.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :role, :string
      add :join_date, :string
      add :email, :string
      add :gender, :string
      add :name, :string
      add :phoneNo, :string

      timestamps()
    end
  end
end
