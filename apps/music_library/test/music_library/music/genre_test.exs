defmodule MusicLibrary.Music.GenreTest do
  use MusicLibrary.DataCase

  alias MusicLibrary.Music.Genre

  describe "genres" do
    alias MusicLibrary.Music.Genre.Genre

    import MusicLibrary.Music.GenreFixtures

    @invalid_attrs %{name: nil}

    test "list_genres/0 returns all genres" do
      genre = genre_fixture()
      assert Genre.list_genres() == [genre]
    end

    test "get_genre!/1 returns the genre with given id" do
      genre = genre_fixture()
      assert Genre.get_genre!(genre.id) == genre
    end

    test "create_genre/1 with valid data creates a genre" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Genre{} = genre} = Genre.create_genre(valid_attrs)
      assert genre.name == "some name"
    end

    test "create_genre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Genre.create_genre(@invalid_attrs)
    end

    test "update_genre/2 with valid data updates the genre" do
      genre = genre_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Genre{} = genre} = Genre.update_genre(genre, update_attrs)
      assert genre.name == "some updated name"
    end

    test "update_genre/2 with invalid data returns error changeset" do
      genre = genre_fixture()
      assert {:error, %Ecto.Changeset{}} = Genre.update_genre(genre, @invalid_attrs)
      assert genre == Genre.get_genre!(genre.id)
    end

    test "delete_genre/1 deletes the genre" do
      genre = genre_fixture()
      assert {:ok, %Genre{}} = Genre.delete_genre(genre)
      assert_raise Ecto.NoResultsError, fn -> Genre.get_genre!(genre.id) end
    end

    test "change_genre/1 returns a genre changeset" do
      genre = genre_fixture()
      assert %Ecto.Changeset{} = Genre.change_genre(genre)
    end
  end

  describe "subgenres" do
    alias MusicLibrary.Music.Genre.SubGenre

    import MusicLibrary.Music.GenreFixtures

    @invalid_attrs %{name: nil}

    test "list_subgenres/0 returns all subgenres" do
      sub_genre = sub_genre_fixture()
      assert Genre.list_subgenres() == [sub_genre]
    end

    test "get_sub_genre!/1 returns the sub_genre with given id" do
      sub_genre = sub_genre_fixture()
      assert Genre.get_sub_genre!(sub_genre.id) == sub_genre
    end

    test "create_sub_genre/1 with valid data creates a sub_genre" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %SubGenre{} = sub_genre} = Genre.create_sub_genre(valid_attrs)
      assert sub_genre.name == "some name"
    end

    test "create_sub_genre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Genre.create_sub_genre(@invalid_attrs)
    end

    test "update_sub_genre/2 with valid data updates the sub_genre" do
      sub_genre = sub_genre_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %SubGenre{} = sub_genre} = Genre.update_sub_genre(sub_genre, update_attrs)
      assert sub_genre.name == "some updated name"
    end

    test "update_sub_genre/2 with invalid data returns error changeset" do
      sub_genre = sub_genre_fixture()
      assert {:error, %Ecto.Changeset{}} = Genre.update_sub_genre(sub_genre, @invalid_attrs)
      assert sub_genre == Genre.get_sub_genre!(sub_genre.id)
    end

    test "delete_sub_genre/1 deletes the sub_genre" do
      sub_genre = sub_genre_fixture()
      assert {:ok, %SubGenre{}} = Genre.delete_sub_genre(sub_genre)
      assert_raise Ecto.NoResultsError, fn -> Genre.get_sub_genre!(sub_genre.id) end
    end

    test "change_sub_genre/1 returns a sub_genre changeset" do
      sub_genre = sub_genre_fixture()
      assert %Ecto.Changeset{} = Genre.change_sub_genre(sub_genre)
    end
  end
end
