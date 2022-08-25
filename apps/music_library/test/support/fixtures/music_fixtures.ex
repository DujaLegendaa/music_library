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
end
