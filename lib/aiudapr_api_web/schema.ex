defmodule AiudaprApiWeb.Schema do
  use Absinthe.Schema

  import_types AiudaprApiWeb.Schema.Types

  query do
    field :spots, list_of(:spot) do
      resolve &AiudaprApiWeb.SpotResolver.all/2
    end
  end

  mutation do
    field :registration, type: :location do
      arg :user, non_null(:user_args)
      arg :location, non_null(:location_args)

      resolve &AiudaprApiWeb.RegistrationResolver.create/2
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
