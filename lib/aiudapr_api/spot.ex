defmodule AiudaprApi.Spot do
  use Ecto.Schema
  import Ecto.Changeset
  alias AiudaprApi.Spot


  schema "spots" do
    field :kind, :string
    field :lat, :float
    field :lon, :float

    timestamps()
  end

  @doc false
  def changeset(%Spot{} = spot, attrs) do
    spot
    |> cast(attrs, [:lat, :lon, :kind])
    |> validate_required([:lat, :lon, :kind])
    |> validate_inclusion(:kind, ["wifi", "oasis", "refugio", "electricidad", "comida"], message: "not a valid spot")
  end
end
