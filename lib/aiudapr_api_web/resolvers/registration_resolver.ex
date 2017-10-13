defmodule AiudaprApiWeb.RegistrationResolver do
  alias AiudaprApi.{User, Location, Repo, ErrorHandler}
  alias Ecto.Multi

  def create(%{user: %{phone: phone} = user_params, location: location_params}, _info) do
    registered_user = Repo.get_by(User, phone: phone)

    if registered_user do
      %{user: registered_user}
      |> insert_location(location_params)
      |> respond()
    else
      user_changeset = User.changeset(%User{}, user_params)

      Multi.new()
      |> Multi.insert(:user, user_changeset)
      |> Multi.run(:location, &insert_location(&1, location_params))
      |> Repo.transaction()
      |> respond()
    end
  end

  defp insert_location(%{user: user}, location_params) do
    %Location{user_id: user.id}
    |> Location.changeset(location_params)
    |> Repo.insert()
  end

  defp respond({:ok, %{location: location}}) do
    {:ok, location}
  end

  defp respond({:ok, location}) do
    {:ok, location}
  end

  defp respond({:error, _resource, %{error: errors}, %{}}) do
    {:error, ErrorHandler.format(errors)}
  end
end
