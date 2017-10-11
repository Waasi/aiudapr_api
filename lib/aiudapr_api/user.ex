defmodule AiudaprApi.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias AiudaprApi.User


  schema "users" do
    field :lat, :float
    field :lon, :float
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:lat, :lon, :name, :phone])
    |> validate_required([:lat, :lon, :phone])
  end
end
