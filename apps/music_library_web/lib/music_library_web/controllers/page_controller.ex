defmodule MusicLibraryWeb.PageController do
  use MusicLibraryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
