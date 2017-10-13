defmodule AiudaprApi.Spot do
  use Ecto.Schema
  import Ecto.Changeset
  alias AiudaprApi.Spot


  schema "spots" do
    field :kind, :string
    field :lat, :float
    field :lon, :float
    field :details, :string

    timestamps()
  end

  @doc false
  def changeset(%Spot{} = spot, attrs) do
    spot
    |> cast(attrs, [:lat, :lon, :kind, :details])
    |> validate_required([:lat, :lon, :kind])
    |> validate_inclusion(:kind, ["wifi", "oasis", "refugio", "electricidad", "gas", "atm"], message: "not a valid spot")
  end
end
