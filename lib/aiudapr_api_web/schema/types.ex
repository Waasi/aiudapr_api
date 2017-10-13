defmodule AiudaprApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :name, :string
    field :phone, :string
    field :lat, :float
    field :lon, :float
  end

  object :spot do
    field :id, :id
    field :kind, :kind
    field :lat, :float
    field :lon, :float
    field :details, :string
  end

  enum :kind do
    value :wifi, as: "wifi"
    value :oasis, as: "oasis"
    value :electricidad, as: "electricidad"
    value :refugio, as: "refugio"
    value :atm, as: "atm"
    value :gas, as: "gas"
  end
end
