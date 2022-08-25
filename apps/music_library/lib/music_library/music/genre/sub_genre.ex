defmodule MusicLibrary.Music.Genre.SubGenre do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subgenres" do
    field :name, :string
    belongs_to :genre, MusicLibrary.Music.Genre.Genre

    timestamps()
  end

  @doc false
  def changeset(sub_genre, attrs) do
    sub_genre
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
