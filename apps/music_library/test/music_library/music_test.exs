defmodule MusicLibrary.MusicTest do
  use MusicLibrary.DataCase

  alias MusicLibrary.Music

  describe "artists" do
    alias MusicLibrary.Music.Artist

    import MusicLibrary.MusicFixtures

    @invalid_attrs %{name: nil}

    test "list_artists/0 returns all artists" do
      artist = artist_fixture()
      assert Music.list_artists() == [artist]
    end

    test "get_artist!/1 returns the artist with given id" do
      artist = artist_fixture()
      assert Music.get_artist!(artist.id) == artist
    end

    test "create_artist/1 with valid data creates a artist" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Artist{} = artist} = Music.create_artist(valid_attrs)
      assert artist.name == "some name"
    end

    test "create_artist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Music.create_artist(@invalid_attrs)
    end

    test "update_artist/2 with valid data updates the artist" do
      artist = artist_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Artist{} = artist} = Music.update_artist(artist, update_attrs)
      assert artist.name == "some updated name"
    end

    test "update_artist/2 with invalid data returns error changeset" do
      artist = artist_fixture()
      assert {:error, %Ecto.Changeset{}} = Music.update_artist(artist, @invalid_attrs)
      assert artist == Music.get_artist!(artist.id)
    end

    test "delete_artist/1 deletes the artist" do
      artist = artist_fixture()
      assert {:ok, %Artist{}} = Music.delete_artist(artist)
      assert_raise Ecto.NoResultsError, fn -> Music.get_artist!(artist.id) end
    end

    test "change_artist/1 returns a artist changeset" do
      artist = artist_fixture()
      assert %Ecto.Changeset{} = Music.change_artist(artist)
    end
  end

  describe "albums" do
    alias MusicLibrary.Music.Album

    import MusicLibrary.MusicFixtures

    @invalid_attrs %{name: nil, year_of_release: nil}

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Music.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Music.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      valid_attrs = %{name: "some name", year_of_release: 42}

      assert {:ok, %Album{} = album} = Music.create_album(valid_attrs)
      assert album.name == "some name"
      assert album.year_of_release == 42
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Music.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      update_attrs = %{name: "some updated name", year_of_release: 43}

      assert {:ok, %Album{} = album} = Music.update_album(album, update_attrs)
      assert album.name == "some updated name"
      assert album.year_of_release == 43
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Music.update_album(album, @invalid_attrs)
      assert album == Music.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Music.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Music.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Music.change_album(album)
    end
  end
end
