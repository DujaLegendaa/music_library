defmodule MusicLibrary.Music.Album do
  use Ecto.Schema
  import Ecto.Changeset

  schema "albums" do
    field :name, :string
    field :year_of_release, :integer
    belongs_to :artist, MusicLibrary.Music.Artist
    belongs_to :genre, MusicLibrary.Music.Genre.Genre
    belongs_to :subgenre, MusicLibrary.Music.Genre.SubGenre

    timestamps()
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:name, :year_of_release])
    |> validate_required([:name, :year_of_release])
  end
end
