defmodule AuthTutorialPhoenix.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AuthTutorialPhoenix.Account` context.
  """

  @doc """
  Generate a permission.
  """
  def permission_fixture(attrs \\ %{}) do
    {:ok, permission} =
      attrs
      |> Enum.into(%{
        delete: true,
        permission_name: "some permission_name",
        read: true,
        write: true
      })
      |> AuthTutorialPhoenix.Account.create_permission()

    permission
  end
end
