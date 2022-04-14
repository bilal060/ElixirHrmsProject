defmodule AuthTutorialPhoenix.Repo.Migrations.CreateAttendances do
  use Ecto.Migration

  def change do
    create table(:attendances, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :check_in, :string
      add :check_out, :string
      add :status, :string
      add :date, :string
      add :employee_id,  references(:employees, on_delete: :nothing, type: :uuid, on_delete: :delete_all)

      timestamps()
    end
  end
end
