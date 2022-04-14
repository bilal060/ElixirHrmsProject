defmodule AuthTutorialPhoenix.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :project_name, :string
      add :start_date, :string
      add :project_cost, :integer
      add :payment_id,  references(:payments, on_delete: :nothing, type: :uuid, on_delete: :delete_all)

    end
  end
end
