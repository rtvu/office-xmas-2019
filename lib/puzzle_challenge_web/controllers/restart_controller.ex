defmodule PuzzleChallengeWeb.RestartController do
  use PuzzleChallengeWeb, :controller

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.home_path(conn, :index))
  end
end
