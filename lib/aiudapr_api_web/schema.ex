defmodule AiudaprApiWeb.Schema do
  use Absinthe.Schema

  import_types AiudaprApiWeb.Schema.Types

  query do
    field :spots, list_of(:spot) do
      resolve &AiudaprApiWeb.SpotResolver.all/2
    end
  end

  mutation do
    field :user, type: :user do
      arg :name, :string
      arg :phone, non_null(:string)
      arg :lat, non_null(:float)
      arg :lon, non_null(:float)

      resolve &AiudaprApiWeb.UserResolver.create/2
    end

    field :spot, type: :spot do
      arg :kind, :kind
      arg :lat, non_null(:float)
      arg :lon, non_null(:float)
      arg :details, :string

      resolve &AiudaprApiWeb.SpotResolver.create/2
    end

    field :spot_for_deletion, type: :string do
      arg :id, non_null(:id)

      resolve &AiudaprApiWeb.SpotResolver.delete/2
    end
  end
end
