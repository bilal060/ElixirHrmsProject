defmodule AuthTutorialPhoenix.Accounts.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :content_type, :string
    field :filename, :string
    field :path, :string

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    IO.inspect("I am in Image Changeset")
    image
    |> cast(attrs, [:content_type, :filename, :path])
    |> validate_required([ :path])
  end
end
