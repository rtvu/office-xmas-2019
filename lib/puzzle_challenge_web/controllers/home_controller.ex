defmodule PuzzleChallengeWeb.HomeController do
  use PuzzleChallengeWeb, :controller

  alias PuzzleChallenge.Puzzle

  def index(conn, params) do
    conn = get_puzzle(conn)
    conn = handle_params(conn, params)

    render(conn, "index.html")
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
    with  true <- Map.has_key?(params, "object"),
          {puzzle, object, gotten?, old?} when not is_nil(object) <- Puzzle.update(conn.assigns[:puzzle], params["object"]) do
      conn
      |> put_session("puzzle", puzzle)
      |> assign(:object, object)
      |> assign(:gotten?, gotten?)
      |> assign(:old?, old?)
    else
      _ ->
        conn
        |> assign(:object, nil)
    end
  end
end
