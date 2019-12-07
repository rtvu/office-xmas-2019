defmodule PuzzleChallengeWeb.DisableLinksController do
  use PuzzleChallengeWeb, :controller

  def index(conn, _params) do
    conn
    |> put_session("links?", false)
    |> redirect(to: Routes.home_path(conn, :index))
  end
end
