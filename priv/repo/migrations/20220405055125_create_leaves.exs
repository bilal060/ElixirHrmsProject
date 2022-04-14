defmodule AuthTutorialPhoenix.Repo.Migrations.CreateLeaves do
  use Ecto.Migration

  def change do
    create table(:leaves, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :leave_type, :string
      add :start_date, :string
      add :end_date, :string
      add :reason, :string
      add :employee_id,  references(:employees, on_delete: :nothing, type: :uuid, on_delete: :delete_all)

      timestamps()
    end
  end
end
