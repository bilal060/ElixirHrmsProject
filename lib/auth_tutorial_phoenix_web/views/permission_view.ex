defmodule AuthTutorialPhoenixWeb.PermissionView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.PermissionView

  def render("index.json", %{permissions: permissions}) do
    %{data: render_many(permissions, PermissionView, "permission.json")}
  end

  def render("show.json", %{permission: permission}) do
    %{data: render_one(permission, PermissionView, "permission.json")}
  end

  def render("permission.json", %{permission: permission}) do
    %{
      id: permission.id,
      permission_name: permission.permission_name,
      write: permission.write,
      read: permission.read,
      delete: permission.delete,
      inserted_by: permission.inserted_by,
      updated_by: permission.updated_by,
      user_id: permission.user_id,
    }
  end
end
