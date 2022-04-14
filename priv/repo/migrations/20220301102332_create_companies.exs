defmodule AuthTutorialPhoenix.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :company_name, :string

      timestamps()
    end
  end
end
