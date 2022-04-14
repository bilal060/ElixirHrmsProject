defmodule AuthTutorialPhoenix.Repo.Migrations.CreateDepartments do
  use Ecto.Migration

  def change do
    create table(:departments, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :department_name, :string
      add :department_head, :string
      add :no_of_employees, :string

      timestamps()
    end
  end
end
