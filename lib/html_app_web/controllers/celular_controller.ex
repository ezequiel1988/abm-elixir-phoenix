defmodule HtmlAppWeb.CelularController do
  use HtmlAppWeb, :controller

  alias HtmlApp.Accounts
  alias HtmlApp.Accounts.Celular

  def index(conn, _params) do
    celulares = Accounts.list_celulares()
    render(conn, "index.html", celulares: celulares)
  end

  def new(conn, _params) do
    changeset = Accounts.change_celular(%Celular{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"celular" => celular_params}) do
    case Accounts.create_celular(celular_params) do
      {:ok, celular} ->
        conn
        |> put_flash(:info, "Celular created successfully.")
        |> redirect(to: Routes.celular_path(conn, :show, celular))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    celular = Accounts.get_celular!(id)
    render(conn, "show.html", celular: celular)
  end

  def edit(conn, %{"id" => id}) do
    celular = Accounts.get_celular!(id)
    changeset = Accounts.change_celular(celular)
    render(conn, "edit.html", celular: celular, changeset: changeset)
  end

  def update(conn, %{"id" => id, "celular" => celular_params}) do
    celular = Accounts.get_celular!(id)

    case Accounts.update_celular(celular, celular_params) do
      {:ok, celular} ->
        conn
        |> put_flash(:info, "Celular updated successfully.")
        |> redirect(to: Routes.celular_path(conn, :show, celular))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", celular: celular, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    celular = Accounts.get_celular!(id)
    {:ok, _celular} = Accounts.delete_celular(celular)

    conn
    |> put_flash(:info, "Celular deleted successfully.")
    |> redirect(to: Routes.celular_path(conn, :index))
  end
end
