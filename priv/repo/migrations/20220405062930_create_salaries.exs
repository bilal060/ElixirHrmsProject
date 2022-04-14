defmodule AuthTutorialPhoenix.Repo.Migrations.CreateSalaries do
  use Ecto.Migration

  def change do
    create table(:salaries, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :salary, :integer
      add :status, :string
      add :employee_id,  references(:employees, on_delete: :nothing, type: :uuid, on_delete: :delete_all)
      timestamps()
    end
  end
end
