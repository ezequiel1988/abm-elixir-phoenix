defmodule HtmlApp.Accounts.Celular do
  use Ecto.Schema
  import Ecto.Changeset

  schema "celulares" do
    field :liberado, :boolean, default: false
    field :modelo, :string
    field :precio, :integer
    field :stock, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(celular, attrs) do
    celular
    |> cast(attrs, [:modelo, :precio, :stock, :liberado])
    |> validate_required([:modelo, :precio, :stock, :liberado])
  end
end
