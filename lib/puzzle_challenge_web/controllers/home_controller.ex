defmodule PuzzleChallengeWeb.HomeController do
  use PuzzleChallengeWeb, :controller

  alias PuzzleChallenge.Puzzle

  def index(conn, params) do
    conn
    |> get_configurations()
    |> get_puzzle()
    |> handle_params(params)
    |> render("index.html")
  end

  defp get_configurations(conn) do
    session_links? = get_session(conn, "links?")
    if session_links? == true do
      conn
      |> assign(:links?, true)
    else
      conn
      |> assign(:links?, false)
    end
  end

  defp get_puzzle(conn) do
    session_puzzle = get_session(conn, "puzzle")
    is_valid_puzzle = valid_puzzle?(session_puzzle)
    if is_valid_puzzle do
      conn
      |> assign(:puzzle, session_puzzle)
    else
      puzzle = Puzzle.new()
      conn
      |> put_session("puzzle", puzzle)
      |> assign(:puzzle, puzzle)
    end
  end

  defp valid_puzzle?(puzzle) do
    case puzzle do
      nil ->
        false
      puzzle ->
        puzzle_set = puzzle |> Map.keys() |> MapSet.new()
        default_puzzle_set = Puzzle.new() |> Map.keys() |> MapSet.new()
        MapSet.equal?(puzzle_set, default_puzzle_set)
    end
  end

  defp handle_params(conn, params) do
    with  true <- Map.has_key?(params, "location"),
          puzzle_temp = conn.assigns[:puzzle],
          location_temp = params["location"],
          {puzzle, location, options} when not is_nil(location) <- Puzzle.update(puzzle_temp, location_temp) do
      conn
      |> put_session("puzzle", puzzle)
      |> assign(:puzzle, puzzle)
      |> assign(:location, location)
      |> assign(:options, options)
    else
      _error ->
        conn
        |> assign(:location, nil)
    end
  end
end
