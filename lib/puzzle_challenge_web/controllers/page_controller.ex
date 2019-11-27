defmodule PuzzleChallengeWeb.PageController do
  use PuzzleChallengeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
