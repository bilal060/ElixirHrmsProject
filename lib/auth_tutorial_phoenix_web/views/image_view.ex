defmodule AuthTutorialPhoenixWeb.ImageView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.ImageView

  def render("index.json", %{images: images}) do
    %{data: render_many(images, ImageView, "image.json")}
  end

  def render("show.json", %{image: image}) do
    %{data: render_one(image, ImageView, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{
      id: image.id,
      content_type: image.content_type,
      filename: image.filename,
      path: image.path
    }
  end
end
