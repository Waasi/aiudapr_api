# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AiudaprApi.Repo.insert!(%AiudaprApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias AiudaprApi.Repo
alias AiudaprApi.Spot

defmodule AtmData do
  def import do
    Path.expand("../data/atm_data.json", __DIR__)
    |> File.read!
    |> Poison.decode!
    |> do_create_spots
  end

  defp do_create_spots(data) do
    Enum.each data["features"], fn(spot) ->
      do_create_spot(spot)
    end
  end

  defp do_create_spot(spot) do
    Repo.insert! %Spot{
      lat: Enum.at(spot["geometry"]["coordinates"], 1),
      lon: Enum.at(spot["geometry"]["coordinates"], 0),
      kind: "atm",
      details: spot["properties"]["bank"]
    }
  end
end

AtmData.import
