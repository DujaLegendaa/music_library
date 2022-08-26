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

  def list_subgenres_of_genre(%Genre{} = genre) do
    SubGenre.Query.for_genre(genre)
    |> Repo.all()
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

end
