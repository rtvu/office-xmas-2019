defmodule PuzzleChallengeWeb.HomeController do
  use PuzzleChallengeWeb, :controller

  alias PuzzleChallenge.Puzzle

  def index(conn, params) do
    conn
    |> get_puzzle()
    |> handle_params(params)
    |> render("index.html")
  end

  defp get_puzzle(conn) do
    case get_session(conn, "puzzle") do
      nil ->
        puzzle = Puzzle.new()
        conn
        |> put_session("puzzle", puzzle)
        |> assign(:puzzle, puzzle)
      puzzle ->
        conn
        |> assign(:puzzle, puzzle)
    end
  end

  defp handle_params(conn, params) do
    with  true <- Map.has_key?(params, "location"),
          {puzzle, location, options} when not is_nil(location) <- Puzzle.update(conn.assigns[:puzzle], params["location"]) do
      conn
      |> put_session("puzzle", puzzle)
      |> assign(:puzzle, puzzle)
      |> assign(:location, location)
      |> assign(:options, options)
    else
      _ ->
        conn
        |> assign(:location, nil)
    end
  end
end
