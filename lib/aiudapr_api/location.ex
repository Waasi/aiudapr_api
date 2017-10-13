defmodule AiudaprApi.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias AiudaprApi.{Location, User}


  schema "locations" do
    field :lat, :float
    field :lon, :float
    field :tag, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Location{} = location, attrs) do
    location
    |> cast(attrs, [:lat, :lon, :tag])
    |> validate_required([:lat, :lon, :tag])
  end
end
