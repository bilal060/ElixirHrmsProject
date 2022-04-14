defmodule AuthTutorialPhoenixWeb.ProjectController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Project

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    projects = Accounts.list_projects()
    render(conn, "index.json", projects: projects)
  end

  def create(conn, %{"project" => project_params}) do
    with {:ok, %Project{} = project} <- Accounts.create_project(project_params) do
        conn
        |> put_status(:created)
        |> render("show.json", project: project)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Accounts.get_project!(id)
    render(conn, "show.json", project: project)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Accounts.get_project!(id)

    with {:ok, %Project{} = project} <- Accounts.update_project(project, project_params) do
      render(conn, "show.json", project: project)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Accounts.get_project!(id)

    with {:ok, %Project{}} <- Accounts.delete_project(project) do
      send_resp(conn, :no_content, "")
    end
  end
end
