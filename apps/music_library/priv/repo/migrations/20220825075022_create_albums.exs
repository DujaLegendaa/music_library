defmodule MusicLibrary.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :name, :string
      add :year_of_release, :integer
      add :artist_id, references(:artists, on_delete: :nothing)
      add :genre_id, references(:genres)
      add :subgenre_id, references(:subgenres)

      timestamps()
    end

    create index(:albums, [:genre_id])
    create index(:albums, [:subgenre_id])
    create index(:albums, [:artist_id])
  end
end
