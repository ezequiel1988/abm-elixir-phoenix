defmodule HtmlApp.Repo.Migrations.CreateCelulares do
  use Ecto.Migration

  def change do
    create table(:celulares) do
      add :modelo, :string
      add :precio, :integer
      add :stock, :boolean, default: false, null: false
      add :liberado, :boolean, default: false, null: false

      timestamps()
    end

  end
end
