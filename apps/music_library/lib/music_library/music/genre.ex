defmodule MusicLibrary.Music.Genre do
  @moduledoc """
  The Music.Genre context.
  """

  import Ecto.Query, warn: false
  alias MusicLibrary.Repo

  alias MusicLibrary.Music.Genre.Genre

  @doc """
  Returns the list of genres.

  ## Examples

      iex> list_genres()
      [%Genre{}, ...]

  """
  def list_genres do
    Repo.all(Genre)
  end

  @doc """
  Gets a single genre.

  Raises `Ecto.NoResultsError` if the Genre does not exist.

  ## Examples

      iex> get_genre!(123)
      %Genre{}

      iex> get_genre!(456)
      ** (Ecto.NoResultsError)

  """
  def get_genre!(id), do: Repo.get!(Genre, id)

  @doc """
  Creates a genre.

  ## Examples

      iex> create_genre(%{field: value})
      {:ok, %Genre{}}

      iex> create_genre(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_genre(attrs \\ %{}) do
    %Genre{}
    |> Genre.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a genre.

  ## Examples

      iex> update_genre(genre, %{field: new_value})
      {:ok, %Genre{}}

      iex> update_genre(genre, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_genre(%Genre{} = genre, attrs) do
    genre
    |> Genre.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a genre.

  ## Examples

      iex> delete_genre(genre)
      {:ok, %Genre{}}

      iex> delete_genre(genre)
      {:error, %Ecto.Changeset{}}

  """
  def delete_genre(%Genre{} = genre) do
    Repo.delete(genre)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking genre changes.

  ## Examples

      iex> change_genre(genre)
      %Ecto.Changeset{data: %Genre{}}

  """
  def change_genre(%Genre{} = genre, attrs \\ %{}) do
    Genre.changeset(genre, attrs)
  end

  alias MusicLibrary.Music.Genre.SubGenre

  @doc """
  Returns the list of subgenres.

  ## Examples

      iex> list_subgenres()
      [%SubGenre{}, ...]

  """
  def list_subgenres do
    Repo.all(SubGenre)
  end

  @doc """
  Gets a single sub_genre.

  Raises `Ecto.NoResultsError` if the Sub genre does not exist.

  ## Examples

      iex> get_sub_genre!(123)
      %SubGenre{}

      iex> get_sub_genre!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sub_genre!(id), do: Repo.get!(SubGenre, id)

  @doc """
  Creates a sub_genre.

  ## Examples

      iex> create_sub_genre(%{field: value})
      {:ok, %SubGenre{}}

      iex> create_sub_genre(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sub_genre(%Genre{} = genre, attrs \\ %{}) do
    %SubGenre{}
    |> SubGenre.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:genre, genre)
    |> Repo.insert()
  end

  @doc """
  Updates a sub_genre.

  ## Examples

      iex> update_sub_genre(sub_genre, %{field: new_value})
      {:ok, %SubGenre{}}

      iex> update_sub_genre(sub_genre, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sub_genre(%SubGenre{} = sub_genre, attrs) do
    sub_genre
    |> SubGenre.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sub_genre.

  ## Examples

      iex> delete_sub_genre(sub_genre)
      {:ok, %SubGenre{}}

      iex> delete_sub_genre(sub_genre)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sub_genre(%SubGenre{} = sub_genre) do
    Repo.delete(sub_genre)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sub_genre changes.

  ## Examples

      iex> change_sub_genre(sub_genre)
      %Ecto.Changeset{data: %SubGenre{}}

  """
  def change_sub_genre(%SubGenre{} = sub_genre, attrs \\ %{}) do
    SubGenre.changeset(sub_genre, attrs)
  end
end
