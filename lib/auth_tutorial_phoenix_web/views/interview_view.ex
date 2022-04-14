defmodule AuthTutorialPhoenixWeb.InterviewView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.InterviewView

  def render("index.json", %{interviews: interviews}) do
    %{data: render_many(interviews, InterviewView, "interview.json")}
  end

  def render("show.json", %{interview: interview}) do
    %{data: render_one(interview, InterviewView, "interview.json")}
  end

  def render("interview.json", %{interview: interview}) do
    %{
      id: interview.id,
      email: interview.email,
      phone: interview.phone,
      name: interview.name,
      current_salary: interview.current_salary,
      expected_salary: interview.expected_salary,
      interview_date: interview.interview_date,
      filepath: interview.filepath,
      offered_salary: interview.offered_salary,
      status: interview.status,
      position: interview.position,
    }
  end
end
