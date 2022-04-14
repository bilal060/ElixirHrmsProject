defmodule AuthTutorialPhoenixWeb.ProjectView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.ProjectView

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    %{data: render_one(project, ProjectView, "project.json")}
  end

  def render("project.json", %{project: project}) do
    %{
      id: project.id,
      project_name: project.project_name,
      start_date: project.start_date,
      project_amount: project.project_amount
    }
  end
end
