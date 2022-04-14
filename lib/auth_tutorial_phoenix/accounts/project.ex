defmodule AuthTutorialPhoenix.Accounts.Project do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "projects" do
    field :project_cost, :integer
    field :project_name, :string
    field :start_date, :string


  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:project_name, :start_date, :project_cost])
    |> validate_required([:project_name, :start_date, :project_cost])
  end
end
