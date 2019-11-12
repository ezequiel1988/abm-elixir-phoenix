defmodule HtmlApp.AccountsTest do
  use HtmlApp.DataCase

  alias HtmlApp.Accounts

  describe "celulares" do
    alias HtmlApp.Accounts.Celular

    @valid_attrs %{liberado: true, modelo: "some modelo", precio: 42, stock: true}
    @update_attrs %{liberado: false, modelo: "some updated modelo", precio: 43, stock: false}
    @invalid_attrs %{liberado: nil, modelo: nil, precio: nil, stock: nil}

    def celular_fixture(attrs \\ %{}) do
      {:ok, celular} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_celular()

      celular
    end

    test "list_celulares/0 returns all celulares" do
      celular = celular_fixture()
      assert Accounts.list_celulares() == [celular]
    end

    test "get_celular!/1 returns the celular with given id" do
      celular = celular_fixture()
      assert Accounts.get_celular!(celular.id) == celular
    end

    test "create_celular/1 with valid data creates a celular" do
      assert {:ok, %Celular{} = celular} = Accounts.create_celular(@valid_attrs)
      assert celular.liberado == true
      assert celular.modelo == "some modelo"
      assert celular.precio == 42
      assert celular.stock == true
    end

    test "create_celular/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_celular(@invalid_attrs)
    end

    test "update_celular/2 with valid data updates the celular" do
      celular = celular_fixture()
      assert {:ok, %Celular{} = celular} = Accounts.update_celular(celular, @update_attrs)
      assert celular.liberado == false
      assert celular.modelo == "some updated modelo"
      assert celular.precio == 43
      assert celular.stock == false
    end

    test "update_celular/2 with invalid data returns error changeset" do
      celular = celular_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_celular(celular, @invalid_attrs)
      assert celular == Accounts.get_celular!(celular.id)
    end

    test "delete_celular/1 deletes the celular" do
      celular = celular_fixture()
      assert {:ok, %Celular{}} = Accounts.delete_celular(celular)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_celular!(celular.id) end
    end

    test "change_celular/1 returns a celular changeset" do
      celular = celular_fixture()
      assert %Ecto.Changeset{} = Accounts.change_celular(celular)
    end
  end
end
