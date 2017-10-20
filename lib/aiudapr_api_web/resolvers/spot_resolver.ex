defmodule AiudaprApiWeb.SpotResolver do
  alias AiudaprApi.{Spot, Repo, ErrorHandler}

  def all(_args, _info) do
    {:ok, Repo.all(Spot)}
  end

  def create(args, %{context: %{entity: _entity}}) do
    response =
      %Spot{}
      |> Spot.changeset(args)
      |> Repo.insert()

    case response do
      {:ok, spot} ->
        {:ok, spot}
      {:error, %{errors: errors}} ->
        {:error, ErrorHandler.format(errors)}
    end
  end

  def create(_, _), do: {:error, "invalid authentication code"}

  def delete(%{id: id}, %{context: %{entity: _entity}}) do
    spot = Repo.get(Spot, id)
    response = Repo.delete(spot)

    case response do
      {:ok, _spot} ->
        {:ok, "deleted spot with id #{id} successfully"}
      {:error, %{errors: errors}} ->
        {:error, ErrorHandler.format(errors)}
    end
  end

  def delete(_, _), do: {:error, "invalid authentication code"}
end
