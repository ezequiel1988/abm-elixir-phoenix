defmodule HtmlApp.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias HtmlApp.Repo

  alias HtmlApp.Accounts.Celular

  @doc """
  Returns the list of celulares.

  ## Examples

      iex> list_celulares()
      [%Celular{}, ...]

  """
  def list_celulares do
    Repo.all(Celular)
  end

  @doc """
  Gets a single celular.

  Raises `Ecto.NoResultsError` if the Celular does not exist.

  ## Examples

      iex> get_celular!(123)
      %Celular{}

      iex> get_celular!(456)
      ** (Ecto.NoResultsError)

  """
  def get_celular!(id), do: Repo.get!(Celular, id)

  @doc """
  Creates a celular.

  ## Examples

      iex> create_celular(%{field: value})
      {:ok, %Celular{}}

      iex> create_celular(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_celular(attrs \\ %{}) do
    %Celular{}
    |> Celular.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a celular.

  ## Examples

      iex> update_celular(celular, %{field: new_value})
      {:ok, %Celular{}}

      iex> update_celular(celular, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_celular(%Celular{} = celular, attrs) do
    celular
    |> Celular.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Celular.

  ## Examples

      iex> delete_celular(celular)
      {:ok, %Celular{}}

      iex> delete_celular(celular)
      {:error, %Ecto.Changeset{}}

  """
  def delete_celular(%Celular{} = celular) do
    Repo.delete(celular)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking celular changes.

  ## Examples

      iex> change_celular(celular)
      %Ecto.Changeset{source: %Celular{}}

  """
  def change_celular(%Celular{} = celular) do
    Celular.changeset(celular, %{})
  end
end
