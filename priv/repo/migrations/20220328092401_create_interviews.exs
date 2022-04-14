defmodule AuthTutorialPhoenix.Repo.Migrations.CreateInterviews do
  use Ecto.Migration

  def change do
    create table(:interviews) do
      add :email, :string
      add :phone, :string
      add :name, :string
      add :current_salary, :integer
      add :expected_salary, :integer
      add :interview_date, :string
      add :filepath, :string
      add :offered_salary, :integer
      add :position, :string
      add :status, :string

      timestamps()
    end
  end
end
