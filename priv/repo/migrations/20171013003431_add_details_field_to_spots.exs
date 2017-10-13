defmodule AiudaprApi.Repo.Migrations.AddDetailsFieldToSpots do
  use Ecto.Migration

  def change do
    alter table(:spots) do
      add :details, :text
    end
  end
end
