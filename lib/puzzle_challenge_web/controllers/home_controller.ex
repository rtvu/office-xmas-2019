defmodule PuzzleChallengeWeb.HomeController do
  use PuzzleChallengeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
