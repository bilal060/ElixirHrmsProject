defmodule AuthTutorialPhoenixWeb.InterviewController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Interview

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    interviews = Accounts.list_interviews()
    # IO.inspect(send_file(conn,200,"images/Capture.PNG"))
   
      render(conn, "index.json", interviews: interviews)
  end

  def create(conn, _) do
    interview_params = conn.params
    photo = interview_params["filepath"]
    File.cp(photo.path, "images/#{photo.filename}")
    data = Map.delete(interview_params, "filepath")
    data2 = Map.put(data, "filepath", "images/#{photo.filename}")

    with {:ok, %Interview{} = interview} <- Accounts.create_interview(data2) do
      conn
      |> put_status(:created)
      |> render("show.json", interview: interview)
    end
  end

  def show(conn, %{"id" => id}) do
    interview = Accounts.get_interview!(id)
    render(conn, "show.json", interview: interview)
  end

  def update(conn, %{"id" => id, "interview" => interview_params}) do
    interview = Accounts.get_interview!(id)

    with {:ok, %Interview{} = interview} <- Accounts.update_interview(interview, interview_params) do
      render(conn, "show.json", interview: interview)
    end
  end

  def delete(conn, %{"id" => id}) do
    interview = Accounts.get_interview!(id)

    with {:ok, %Interview{}} <- Accounts.delete_interview(interview) do
      send_resp(conn, :no_content, "")
    end
  end
end
