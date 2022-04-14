defmodule AuthTutorialPhoenix.AccountTest do
  use AuthTutorialPhoenix.DataCase

  alias AuthTutorialPhoenix.Account

  describe "permissions" do
    alias AuthTutorialPhoenix.Account.Permission

    import AuthTutorialPhoenix.AccountFixtures

    @invalid_attrs %{delete: nil, permission_name: nil, read: nil, write: nil}

    test "list_permissions/0 returns all permissions" do
      permission = permission_fixture()
      assert Account.list_permissions() == [permission]
    end

    test "get_permission!/1 returns the permission with given id" do
      permission = permission_fixture()
      assert Account.get_permission!(permission.id) == permission
    end

    test "create_permission/1 with valid data creates a permission" do
      valid_attrs = %{delete: true, permission_name: "some permission_name", read: true, write: true}

      assert {:ok, %Permission{} = permission} = Account.create_permission(valid_attrs)
      assert permission.delete == true
      assert permission.permission_name == "some permission_name"
      assert permission.read == true
      assert permission.write == true
    end

    test "create_permission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_permission(@invalid_attrs)
    end

    test "update_permission/2 with valid data updates the permission" do
      permission = permission_fixture()
      update_attrs = %{delete: false, permission_name: "some updated permission_name", read: false, write: false}

      assert {:ok, %Permission{} = permission} = Account.update_permission(permission, update_attrs)
      assert permission.delete == false
      assert permission.permission_name == "some updated permission_name"
      assert permission.read == false
      assert permission.write == false
    end

    test "update_permission/2 with invalid data returns error changeset" do
      permission = permission_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_permission(permission, @invalid_attrs)
      assert permission == Account.get_permission!(permission.id)
    end

    test "delete_permission/1 deletes the permission" do
      permission = permission_fixture()
      assert {:ok, %Permission{}} = Account.delete_permission(permission)
      assert_raise Ecto.NoResultsError, fn -> Account.get_permission!(permission.id) end
    end

    test "change_permission/1 returns a permission changeset" do
      permission = permission_fixture()
      assert %Ecto.Changeset{} = Account.change_permission(permission)
    end
  end
end
