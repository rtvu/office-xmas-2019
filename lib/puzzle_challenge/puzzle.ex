defmodule PuzzleChallenge.Puzzle do
  alias PuzzleChallenge.Puzzle

  defstruct [
    flashlight: false,
    pickaxe: false,
    magic_glasses: false,
    key: false,
    dust_balls: false,
    cotton_balls: false,
    reindeer_treats: false,
    coal: false,
    santas_magic_book: false,
    button: false,
    pink_stone: false,
    cookie: false,
    new_pixie_dust: false,
    old_pixie_dust: false,
    heart_teddy_bear: false,
    grinch_friend: false,
    last_bear_component: nil
  ]

  # LOCATIONS:
  #   - flashlight
  #   - pickaxe
  #   - magic_glasses
  #   - picture_frame_a
  #   - picture_frame_b
  #   - picture_frame_c
  #   - dark_area_a
  #   - dark_area_b
  #   - dark_area_c
  #   - dark_area_d
  #   - locked_chest
  #   - coal
  #   - present
  #   - santas_magic_book
  #   - button_pillow
  #   - rock_a
  #   - rock_b
  #   - jar
  #   - bag_of_pixie_dust
  #   - workbench
  #   - plant

  def new() do
    %Puzzle{}
  end

  def update(puzzle, location)

  def update(puzzle, location = "flashlight") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        puzzle = %{puzzle | flashlight: true}
        {puzzle, location, :acquired_flashlight}
      %Puzzle{flashlight: true} ->
        {puzzle, location, :already_acquired_flashlight}
    end
  end

  def update(puzzle, location = "pickaxe") do
    case puzzle do
      %Puzzle{pickaxe: false} ->
        puzzle = %{puzzle | pickaxe: true}
        {puzzle, location, :acquired_pickaxe}
      %Puzzle{pickaxe: true} ->
        {puzzle, location, :already_acquired_pickaxe}
    end
  end

  def update(puzzle, location = "magic_glasses") do
    case puzzle do
      %Puzzle{magic_glasses: false} ->
        puzzle = %{puzzle | magic_glasses: true}
        {puzzle, location, :acquired_magic_glasses}
      %Puzzle{magic_glasses: true} ->
        {puzzle, location, :already_acquired_magic_glasses}
    end
  end

  def update(puzzle, location = "picture_frame_a") do
    case puzzle do
      %Puzzle{magic_glasses: false} ->
        {puzzle, location, :missing_magic_glasses}
      %Puzzle{magic_glasses: true} ->
        {puzzle, location, :have_magic_glasses}
    end
  end

  def update(puzzle, location = "picture_frame_b") do
    case puzzle do
      %Puzzle{magic_glasses: false} ->
        {puzzle, location, :missing_magic_glasses}
      %Puzzle{magic_glasses: true} ->
        {puzzle, location, :have_magic_glasses}
    end
  end

  def update(puzzle, location = "picture_frame_c") do
    case puzzle do
      %Puzzle{magic_glasses: false} ->
        {puzzle, location, :missing_magic_glasses}
      %Puzzle{magic_glasses: true} ->
        {puzzle, location, :have_magic_glasses}
    end
  end

  def update(puzzle, location = "dark_area_a") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {puzzle, location, :cannot_see}
      %Puzzle{flashlight: true} ->
        {puzzle, location, :nothing_to_see}
    end
  end

  def update(puzzle, location = "dark_area_b") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {puzzle, location, :cannot_see}
      %Puzzle{flashlight: true, key: false} ->
        puzzle = %{puzzle | key: true}
        {puzzle, location, :acquired_key}
      %Puzzle{flashlight: true, key: true} ->
        {puzzle, location, :nothing_to_see}
    end
  end

  def update(puzzle, location = "dark_area_c") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {puzzle, location, :cannot_see}
      %Puzzle{flashlight: true, dust_balls: false} ->
        puzzle = %{puzzle | dust_balls: true}
        {puzzle, location, :acquired_dust_balls}
      %Puzzle{flashlight: true, dust_balls: true} ->
        {puzzle, location, :acquired_more_dust_balls}
    end
  end

  def update(puzzle, location = "dark_area_d") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {puzzle, location, :cannot_see}
      %Puzzle{flashlight: true, cotton_balls: false} ->
        puzzle = %{puzzle | cotton_balls: true, last_bear_component: :cotton_balls}
        {puzzle, location, :acquired_cotton_balls}
      %Puzzle{flashlight: true, cotton_balls: true} ->
        {puzzle, location, :left_additional_cotton_balls}
    end
  end

  def update(puzzle, location = "locked_chest") do
    case puzzle do
      %Puzzle{key: false} ->
        {puzzle, location, :no_key}
      %Puzzle{key: true, reindeer_treats: false} ->
        puzzle = %{puzzle | reindeer_treats: true}
        {puzzle, location, :opened_chest}
      %Puzzle{key: true, reindeer_treats: true} ->
        {puzzle, location, :already_opened_chest}
    end
  end

  def update(puzzle, location = "coal") do
    case puzzle do
      %Puzzle{coal: false} ->
        puzzle = %{puzzle | coal: true}
        {puzzle, location, :acquired_coal}
      %Puzzle{coal: true} ->
        {puzzle, location, :acquired_more_coal}
    end
  end

  def update(puzzle, location = "santas_magic_book") do
    case puzzle do
      %Puzzle{santas_magic_book: false} ->
        puzzle = %{puzzle | santas_magic_book: true}
        {puzzle, location, :acquired_santas_magic_book}
      %Puzzle{santas_magic_book: true} ->
        {puzzle, location, :already_acquired_santas_magic_book}
    end
  end

  def update(puzzle, location = "button_pillow") do
    case puzzle do
      %Puzzle{button: false} ->
        puzzle = %{puzzle | button: true, last_bear_component: :button}
        {puzzle, location, :acquired_button}
      %Puzzle{button: true} ->
        {puzzle, location, :already_acquired_button}
    end
  end

  def update(puzzle, location = "rock_a") do
    case puzzle do
      %Puzzle{pickaxe: false} ->
        {puzzle, location, :cannot_break_rock}
      %Puzzle{pickaxe: true, pink_stone: false} ->
        puzzle = %{puzzle | pink_stone: true, last_bear_component: :pink_stone}
        {puzzle, location, :acquired_pink_stone}
      %Puzzle{pickaxe: true, pink_stone: true} ->
        {puzzle, location, :broke_rock}
    end
  end

  def update(puzzle, location = "rock_b") do
    case puzzle do
      %Puzzle{pickaxe: false} ->
        {puzzle, location, :cannot_break_rock}
      %Puzzle{pickaxe: true} ->
        {puzzle, location, :broke_rock}
    end
  end

  def update(puzzle, location = "jar") do
    case puzzle do
      %Puzzle{cookie: false} ->
        puzzle = %{puzzle | cookie: true, last_bear_component: :cookie}
        {puzzle, location, :acquired_cookie}
      %Puzzle{cookie: true} ->
        {puzzle, location, :already_acquired_cookie}
    end
  end

  def update(puzzle, location = "bag_of_pixie_dust") do
    case puzzle do
      %Puzzle{new_pixie_dust: true} ->
        {puzzle, location, :already_acquired_new_pixie_dust}
      %Puzzle{cotton_balls: true, button: true, pink_stone: true, cookie: true} ->
        puzzle = %{puzzle | new_pixie_dust: true, old_pixie_dust: false}
        {puzzle, location, :acquired_new_pixie_dust}
      %Puzzle{} ->
        puzzle = %{puzzle | new_pixie_dust: false, old_pixie_dust: true}
        {puzzle, location, :acquired_old_pixie_dust}
    end
  end

  def update(puzzle, location = "workbench") do
    case puzzle do
      %Puzzle{heart_teddy_bear: true} ->
        {puzzle, location, :already_acquired_heart_teddy_bear}
      %Puzzle{heart_teddy_bear: false, cotton_balls: true, button: true, pink_stone: true, cookie: true, new_pixie_dust: true, santas_magic_book: true} ->
        puzzle = %{puzzle | heart_teddy_bear: true}
        {puzzle, location, :acquired_heart_teddy_bear}
      %Puzzle{} ->
        {puzzle, location, :nothing_happens}
    end
  end

  def update(puzzle, location = "plant") do
    case puzzle do
      %Puzzle{heart_teddy_bear: true, grinch_friend: false} ->
        puzzle = %{puzzle | grinch_friend: true}
        {puzzle, location, :acquired_grinch_friend}
      %Puzzle{heart_teddy_bear: true, grinch_friend: true} ->
        {puzzle, location, :already_acquired_grinch_friend}
      %Puzzle{last_bear_component: component} ->
        if is_nil(component) do
          {puzzle, location, :see_grinch}
        else
          puzzle = Map.put(puzzle, component, false)
          puzzle = Map.put(puzzle, :last_bear_component, nil)
          {puzzle, location, {:grinch_stole_item, component}}
        end
    end
  end

  def update(puzzle, _location) do
    {puzzle, nil, nil}
  end
end
