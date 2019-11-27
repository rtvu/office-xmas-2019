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
end
