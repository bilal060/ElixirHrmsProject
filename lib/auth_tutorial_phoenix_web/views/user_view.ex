defmodule AuthTutorialPhoenixWeb.UserView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      permission: render_many(user.permissions, __MODULE__, "role.json", as: :permission),
      profile: render_one(user.profiles, __MODULE__, "profile.json", as: :profile),
      role: user.role,
      inserted_at: user.inserted_at,
    }
  end

  def render("role.json", %{permission: permission}) do
    %{
      id: permission.id,
      permisson_name: permission.permission_name,
      read: permission.read,
      write: permission.write,
      delete: permission.delete
    }
  end

  def render("profile.json", %{profile: profile}) do

    %{
      cnic: profile.cnic,
      first_name: profile.first_name,
      last_name: profile.last_name,
      username: profile.username,
    }
  end

  # def render("profiles.json", %{profile: profile}) do
  #   %{
  #     cnic: profile.cnic,

  #   }
  # end


  def render("userId.json", %{user: user}) do
    %{
      id: user.id,
    }
  end
end
