defmodule MusicLibrary.Music.Genre.Genre do
  use Ecto.Schema
  import Ecto.Changeset

  schema "genres" do
    field :name, :string
    has_many :subgenres, MusicLibrary.Music.Genre.SubGenre

    timestamps()
  end

  @doc false
  def changeset(genre, attrs) do
    genre
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
