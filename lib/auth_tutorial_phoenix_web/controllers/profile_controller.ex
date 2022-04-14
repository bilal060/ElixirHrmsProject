defmodule AuthTutorialPhoenixWeb.ProfileController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Profile

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    profiles = Accounts.list_profiles()
    # comments = Repo.all(assoc(user, :comments))
    render(conn, "index.json", profiles: profiles)
  end

  # def create(conn, %{"profile" => profile_params}) do
  #   with {:ok, %Profile{} = profile} <- Accounts.create_profile(profile_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.profile_path(conn, :show, profile))
  #     |> render("show.json", profile: profile)
  #   end
  # end

  def create(conn, %{"profile" => profile_params}) do
    with {:ok, %Profile{} = profile} <- Accounts.create_profile(profile_params) do

      conn
      |> put_status(:created)
      |> text("User is Registered successfully:" <> " " <> profile.username)

    end
  end

  def show(conn, %{"id" => id}) do
    profile = Accounts.get_profile!(id)
    render(conn, "show.json", profile: profile)
  end

  def update(conn, %{"id" => id, "profile" => profile_params}) do
    profile = Accounts.get_profile!(id)

    with {:ok, %Profile{} = profile} <- Accounts.update_profile(profile, profile_params) do
      render(conn, "show.json", profile: profile)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile = Accounts.get_profile!(id)

    with {:ok, %Profile{}} <- Accounts.delete_profile(profile) do
      send_resp(conn, :no_content, "")
    end
  end
end
