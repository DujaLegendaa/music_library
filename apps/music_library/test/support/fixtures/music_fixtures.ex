defmodule MusicLibrary.MusicFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MusicLibrary.Music` context.
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
      |> MusicLibrary.Music.create_genre()

    genre
  end

  @doc """
  Generate a format.
  """
  def format_fixture(attrs \\ %{}) do
    {:ok, format} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MusicLibrary.Music.create_format()

    format
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
      |> MusicLibrary.Music.create_sub_genre()

    sub_genre
  end

  @doc """
  Generate a artist.
  """
  def artist_fixture(attrs \\ %{}) do
    {:ok, artist} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MusicLibrary.Music.create_artist()

    artist
  end

  @doc """
  Generate a album.
  """
  def album_fixture(attrs \\ %{}) do
    {:ok, album} =
      attrs
      |> Enum.into(%{
        name: "some name",
        year_of_release: 42
      })
      |> MusicLibrary.Music.create_album()

    album
  end
end
