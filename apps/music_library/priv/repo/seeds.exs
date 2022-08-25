# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MusicLibrary.Repo.insert!(%MusicLibrary.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
alias MusicLibrary.Music.Genre
alias MusicLibrary.Repo


Repo.delete_all(Genre.SubGenre)
Repo.delete_all(Genre.Genre)
Repo.query!("ALTER SEQUENCE subgenres_id_seq RESTART")
Repo.query!("ALTER SEQUENCE genres_id_seq RESTART")

{:ok, json_str} = :file.read_file("priv/repo/genres.json")
{:ok, decoded} = JSON.decode(json_str)
genres = decoded["genres"]

for {genre, subgenre_list} <- genres  do
  g = Repo.insert!(%Genre.Genre{name: genre})
  for subgenre <- subgenre_list  do
    Ecto.build_assoc(g, :subgenres, %{name: subgenre})
    |> Repo.insert!()
  end
end
