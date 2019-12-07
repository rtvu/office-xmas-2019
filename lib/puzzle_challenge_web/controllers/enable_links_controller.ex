defmodule PuzzleChallengeWeb.EnableLinksController do
  use PuzzleChallengeWeb, :controller

  def index(conn, _params) do
    conn
    |> put_session("links?", true)
    |> redirect(to: Routes.home_path(conn, :index))
  end
end
