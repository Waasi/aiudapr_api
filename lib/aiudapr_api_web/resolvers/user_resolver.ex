defmodule AiudaprApiWeb.UserResolver do
  alias AiudaprApi.{User, Repo, ErrorHandler}

  def create(args, _info) do
    response =
      %User{}
      |> User.changeset(args)
      |> Repo.insert()

    case response do
      {:ok, user} ->
        {:ok, user}
      {:error, %{errors: errors}} ->
        {:error, ErrorHandler.format(errors)}
    end
  end
end
