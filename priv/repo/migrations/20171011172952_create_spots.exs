defmodule AiudaprApi.Repo.Migrations.CreateSpots do
  use Ecto.Migration

  def change do
    create table(:spots) do
      add :lat, :float
      add :lon, :float
      add :kind, :string

      timestamps()
    end

  end
end
