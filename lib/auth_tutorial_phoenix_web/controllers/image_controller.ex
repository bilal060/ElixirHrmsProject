defmodule AuthTutorialPhoenixWeb.ImageController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Image

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def show(conn, %{"id" => id}) do
    IO.inspect(id)
    path = "images/#{id}"
    send_download(conn, {:file, path})
  end

  def delete(conn, %{"id" => id}) do
    image = Accounts.get_image!(id)

    with {:ok, %Image{}} <- Accounts.delete_image(image) do
      send_resp(conn, :no_content, "")
    end
  end
end
