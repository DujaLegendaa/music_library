defmodule MusicLibrary.Music.Artist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    field :name, :string
    has_many :albums, MusicLibrary.Music.Album

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
