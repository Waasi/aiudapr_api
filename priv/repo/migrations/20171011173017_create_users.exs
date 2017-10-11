defmodule AiudaprApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :lat, :float
      add :lon, :float
      add :name, :string
      add :phone, :string

      timestamps()
    end

  end
end
