defmodule MusicLibrary.Music.Genre.SubGenre.Query do
  import Ecto.Query
  alias MusicLibrary.Music.Genre.SubGenre
  
  def base, do: SubGenre

  def for_genre(genre, query \\ base()) do
    query
    |> where([u], u.genre_id == ^genre.id)
  end
end
