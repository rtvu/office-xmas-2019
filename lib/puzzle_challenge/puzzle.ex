defmodule PuzzleChallenge.Puzzle do
  alias PuzzleChallenge.Puzzle

  defstruct [
    treasure: false,
    flashlight: false,
    key: false,
  ]

  # Locations:
  #   - flashlight
  #   - treasure_chest
  #   - shelf_a
  #   - shelf_b

  def new() do
    %Puzzle{}
  end

  def update(puzzle, location)

  def update(puzzle, "flashlight") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {%{puzzle | flashlight: true}, "flashlight", :acquired_flashlight}
      %Puzzle{flashlight: true} ->
        {puzzle, "flashlight", :already_acquired_flashlight}
    end
  end

  def update(puzzle, "treasure_chest") do
    case puzzle do
      %Puzzle{key: false} ->
        {puzzle, "treasure_chest", :no_key}
      %Puzzle{key: true, treasure: false} ->
        {%{puzzle | treasure: true}, "treasure_chest", :found_treasure}
      %Puzzle{key: true} ->
        {puzzle, "treasure_chest", :already_found_treasure}
    end
  end

  def update(puzzle, "shelf_a") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {puzzle, "shelf_a", :cannot_see}
      %Puzzle{flashlight: true} ->
        {puzzle, "shelf_a", :nothing_to_see}
    end
  end


  def update(puzzle, "shelf_b") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {puzzle, "shelf_b", :cannot_see}
      %Puzzle{flashlight: true, key: false} ->
        {%{puzzle | key: true}, "shelf_b", :found_key}
      %Puzzle{flashlight: true, key: true} ->
        {puzzle, "shelf_b", :nothing_to_see}
    end
  end

  def update(puzzle, _location) do
    {puzzle, nil, nil}
  end
end
