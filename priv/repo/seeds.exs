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

defmodule SpotDataImporter do
  def import(file_name, kind, details_key) do
    Path.expand("../data/#{file_name}", __DIR__)
    |> File.read!
    |> Poison.decode!
    |> do_import_spots(kind, details_key)
  end

  defp do_import_spots(aiuda_data, kind, details_key) do
    Enum.each aiuda_data["features"], fn(spot) ->
      do_import_spot(spot, kind, details_key)
    end
  end

  defp do_import_spot(spot, kind, details_key) do
    Repo.insert! %Spot{
      lat: Enum.at(spot["geometry"]["coordinates"], 1),
      lon: Enum.at(spot["geometry"]["coordinates"], 0),
      kind: kind,
      details: spot["properties"][details_key]
    }
  end
end

SpotDataImporter.import("atm_data.json", "atm", "Bank")
SpotDataImporter.import("wifi_data.json", "wifi", "Name")
SpotDataImporter.import("oasis_data.json", "oasis", "Name")
