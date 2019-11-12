defmodule HtmlAppWeb.CelularControllerTest do
  use HtmlAppWeb.ConnCase

  alias HtmlApp.Accounts

  @create_attrs %{liberado: true, modelo: "some modelo", precio: 42, stock: true}
  @update_attrs %{liberado: false, modelo: "some updated modelo", precio: 43, stock: false}
  @invalid_attrs %{liberado: nil, modelo: nil, precio: nil, stock: nil}

  def fixture(:celular) do
    {:ok, celular} = Accounts.create_celular(@create_attrs)
    celular
  end

  describe "index" do
    test "lists all celulares", %{conn: conn} do
      conn = get(conn, Routes.celular_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Celulares"
    end
  end

  describe "new celular" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.celular_path(conn, :new))
      assert html_response(conn, 200) =~ "New Celular"
    end
  end

  describe "create celular" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.celular_path(conn, :create), celular: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.celular_path(conn, :show, id)

      conn = get(conn, Routes.celular_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Celular"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.celular_path(conn, :create), celular: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Celular"
    end
  end

  describe "edit celular" do
    setup [:create_celular]

    test "renders form for editing chosen celular", %{conn: conn, celular: celular} do
      conn = get(conn, Routes.celular_path(conn, :edit, celular))
      assert html_response(conn, 200) =~ "Edit Celular"
    end
  end

  describe "update celular" do
    setup [:create_celular]

    test "redirects when data is valid", %{conn: conn, celular: celular} do
      conn = put(conn, Routes.celular_path(conn, :update, celular), celular: @update_attrs)
      assert redirected_to(conn) == Routes.celular_path(conn, :show, celular)

      conn = get(conn, Routes.celular_path(conn, :show, celular))
      assert html_response(conn, 200) =~ "some updated modelo"
    end

    test "renders errors when data is invalid", %{conn: conn, celular: celular} do
      conn = put(conn, Routes.celular_path(conn, :update, celular), celular: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Celular"
    end
  end

  describe "delete celular" do
    setup [:create_celular]

    test "deletes chosen celular", %{conn: conn, celular: celular} do
      conn = delete(conn, Routes.celular_path(conn, :delete, celular))
      assert redirected_to(conn) == Routes.celular_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.celular_path(conn, :show, celular))
      end
    end
  end

  defp create_celular(_) do
    celular = fixture(:celular)
    {:ok, celular: celular}
  end
end
