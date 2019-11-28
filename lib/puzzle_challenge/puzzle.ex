defmodule PuzzleChallenge.Puzzle do
  alias PuzzleChallenge.Puzzle

  defstruct [
    treasure_chest: false,
    flashlight: false,
    shelf1: false,
    shelf2: false
  ]

  def new() do
    %Puzzle{}
  end

  def update(puzzle, "flashlight") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {%{puzzle | flashlight: true}, "flashlight", true, false}
      %Puzzle{flashlight: true} ->
        {puzzle, "flashlight", true, true}
    end
  end
end
