defmodule MusicLibrary.Repo.Migrations.CreateSubgenres do
  use Ecto.Migration

  def change do
    create table(:subgenres) do
      add :name, :string
      add :genre_id, references(:genres, on_delete: :nothing)

      timestamps()
    end

    create index(:subgenres, [:genre_id])
  end
end
