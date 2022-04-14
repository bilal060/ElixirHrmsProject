defmodule AuthTutorialPhoenixWeb.ProfileView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.ProfileView

  def render("index.json", %{profiles: profiles}) do
    %{data: render_many(profiles, ProfileView, "profile.json")}
  end

  def render("show.json", %{profile: profile}) do
    %{data: render_one(profile, ProfileView, "profile.json")}
  end

  def render("profile.json", %{profile: profile}) do
    %{
      id: profile.id,
      last_name: profile.last_name,
      first_name: profile.first_name,
      username: profile.username,
      cnic: profile.cnic,
      company_id: profile.company_id,
      user_id: profile.user_id
    }
  end
end
