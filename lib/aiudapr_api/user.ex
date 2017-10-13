defmodule AiudaprApi.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias AiudaprApi.{User, Location}


  schema "users" do
    field :name, :string
    field :phone, :string
    has_many :locations, Location

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :phone])
    |> validate_required([:phone])
  end
end
