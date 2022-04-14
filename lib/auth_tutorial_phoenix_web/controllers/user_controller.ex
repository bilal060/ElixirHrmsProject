defmodule AuthTutorialPhoenixWeb.UserController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.User



  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  # def create(conn, %{"user" => user_params}) do
  #   with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.user_path(conn, :show, user))
  #     |> render("show.json", user: user)
  #   end
  # end

  def register(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      Accounts.create_permission((Map.put(user_params["permission"], "user_id", user.id)))
      Accounts.create_profile((Map.put(user_params["profile"], "user_id", user.id)))
      conn
      |> put_status(:created)

      render(conn, "userId.json", user: user)

    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do

        user = Accounts.get_user!(id)


    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do

      profile = Accounts.get_profile!(user.profiles.id)

      Accounts.update_profile(profile, user_params["profile"])

      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
