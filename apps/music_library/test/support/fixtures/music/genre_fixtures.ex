defmodule MusicLibrary.Music.GenreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MusicLibrary.Music.Genre` context.
  """

  @doc """
  Generate a genre.
  """
  def genre_fixture(attrs \\ %{}) do
    {:ok, genre} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MusicLibrary.Music.Genre.create_genre()

    genre
  end

  @doc """
  Generate a sub_genre.
  """
  def sub_genre_fixture(attrs \\ %{}) do
    {:ok, sub_genre} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MusicLibrary.Music.Genre.create_sub_genre()

    sub_genre
  end
end
