defmodule AuthTutorialPhoenix.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :item, :string
      add :from, :string
      add :date, :string
      add :paid_by, :string
      add :status, :string
      add :amount, :integer
      add :employee_id,  references(:employees, on_delete: :nothing, type: :uuid, on_delete: :delete_all)

      timestamps()
    end
  end
end
