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
    last_bear_component: nil,
    inventory: []
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
      %Puzzle{flashlight: false, inventory: inventory} ->
        inventory = [:flashlight | inventory]
        puzzle = %{puzzle | flashlight: true, inventory: inventory}
        {puzzle, location, :acquired_flashlight}
      %Puzzle{flashlight: true} ->
        {puzzle, location, :already_acquired_flashlight}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "pickaxe") do
    case puzzle do
      %Puzzle{pickaxe: false, inventory: inventory} ->
        inventory = [:pickaxe | inventory]
        puzzle = %{puzzle | pickaxe: true, inventory: inventory}
        {puzzle, location, :acquired_pickaxe}
      %Puzzle{pickaxe: true} ->
        {puzzle, location, :already_acquired_pickaxe}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "magic_glasses") do
    case puzzle do
      %Puzzle{magic_glasses: false, inventory: inventory} ->
        inventory = [:magic_glasses | inventory]
        puzzle = %{puzzle | magic_glasses: true, inventory: inventory}
        {puzzle, location, :acquired_magic_glasses}
      %Puzzle{magic_glasses: true} ->
        {puzzle, location, :already_acquired_magic_glasses}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "picture_frame_a") do
    case puzzle do
      %Puzzle{magic_glasses: false} ->
        {puzzle, location, :missing_magic_glasses}
      %Puzzle{magic_glasses: true} ->
        {puzzle, location, :have_magic_glasses}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "picture_frame_b") do
    case puzzle do
      %Puzzle{magic_glasses: false} ->
        {puzzle, location, :missing_magic_glasses}
      %Puzzle{magic_glasses: true} ->
        {puzzle, location, :have_magic_glasses}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "picture_frame_c") do
    case puzzle do
      %Puzzle{magic_glasses: false} ->
        {puzzle, location, :missing_magic_glasses}
      %Puzzle{magic_glasses: true} ->
        {puzzle, location, :have_magic_glasses}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "dark_area_a") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {puzzle, location, :cannot_see}
      %Puzzle{flashlight: true} ->
        {puzzle, location, :nothing_to_see}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "dark_area_b") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {puzzle, location, :cannot_see}
      %Puzzle{flashlight: true, key: false, inventory: inventory} ->
        inventory = [:key | inventory]
        puzzle = %{puzzle | key: true, inventory: inventory}
        {puzzle, location, :acquired_key}
      %Puzzle{flashlight: true, key: true} ->
        {puzzle, location, :nothing_to_see}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "dark_area_c") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {puzzle, location, :cannot_see}
      %Puzzle{flashlight: true, dust_balls: false, inventory: inventory} ->
        inventory = [:dust_balls | inventory]
        puzzle = %{puzzle | dust_balls: true, inventory: inventory}
        {puzzle, location, :acquired_dust_balls}
      %Puzzle{flashlight: true, dust_balls: true, inventory: inventory} ->
        inventory = List.delete(inventory, :dust_balls)
        inventory = [:dust_balls | inventory]
        puzzle = %{puzzle | inventory: inventory}
        {puzzle, location, :acquired_more_dust_balls}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "dark_area_d") do
    case puzzle do
      %Puzzle{flashlight: false} ->
        {puzzle, location, :cannot_see}
      %Puzzle{flashlight: true, cotton_balls: cotton_balls?, grinch_friend: grinch_friend?, heart_teddy_bear: heart_teddy_bear?} when cotton_balls? or grinch_friend? or heart_teddy_bear? ->
        {puzzle, location, :left_additional_cotton_balls}
      %Puzzle{flashlight: true, cotton_balls: false, inventory: inventory} ->
        inventory = [:cotton_balls | inventory]
        puzzle = %{puzzle | cotton_balls: true, last_bear_component: :cotton_balls, inventory: inventory}
        {puzzle, location, :acquired_cotton_balls}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "locked_chest") do
    case puzzle do
      %Puzzle{key: false} ->
        {puzzle, location, :no_key}
      %Puzzle{key: true, reindeer_treats: false, inventory: inventory} ->
        inventory = [:reindeer_treats | inventory]
        puzzle = %{puzzle | reindeer_treats: true, inventory: inventory}
        {puzzle, location, :opened_chest}
      %Puzzle{key: true, reindeer_treats: true} ->
        {puzzle, location, :already_opened_chest}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "coal") do
    case puzzle do
      %Puzzle{coal: false, inventory: inventory} ->
        inventory = [:coal | inventory]
        puzzle = %{puzzle | coal: true, inventory: inventory}
        {puzzle, location, :acquired_coal}
      %Puzzle{coal: true, inventory: inventory} ->
        inventory = [:coal | inventory]
        puzzle = %{puzzle | inventory: inventory}
        {puzzle, location, :acquired_more_coal}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "santas_magic_book") do
    case puzzle do
      %Puzzle{santas_magic_book: false, inventory: inventory} ->
        inventory = [:santas_magic_book | inventory]
        puzzle = %{puzzle | santas_magic_book: true, inventory: inventory}
        {puzzle, location, :acquired_santas_magic_book}
      %Puzzle{santas_magic_book: true} ->
        {puzzle, location, :already_acquired_santas_magic_book}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "button_pillow") do
    case puzzle do
      %Puzzle{button: button?, grinch_friend: grinch_friend?, heart_teddy_bear: heart_teddy_bear?} when button? or grinch_friend? or heart_teddy_bear? ->
        {puzzle, location, :already_acquired_button}
      %Puzzle{button: false, inventory: inventory} ->
        inventory = [:button | inventory]
        puzzle = %{puzzle | button: true, last_bear_component: :button, inventory: inventory}
        {puzzle, location, :acquired_button}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "rock_a") do
    case puzzle do
      %Puzzle{pickaxe: false} ->
        {puzzle, location, :cannot_break_rock}
      %Puzzle{pickaxe: true, pink_stone: pink_stone?, grinch_friend: grinch_friend?, heart_teddy_bear: heart_teddy_bear?} when pink_stone? or grinch_friend? or heart_teddy_bear? ->
        {puzzle, location, :broke_rock}
      %Puzzle{pickaxe: true, pink_stone: false, inventory: inventory} ->
        inventory = [:pink_stone | inventory]
        puzzle = %{puzzle | pink_stone: true, last_bear_component: :pink_stone, inventory: inventory}
        {puzzle, location, :acquired_pink_stone}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "rock_b") do
    case puzzle do
      %Puzzle{pickaxe: false} ->
        {puzzle, location, :cannot_break_rock}
      %Puzzle{pickaxe: true} ->
        {puzzle, location, :broke_rock}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "jar") do
    case puzzle do
      %Puzzle{cookie: cookie?, grinch_friend: grinch_friend?, heart_teddy_bear: heart_teddy_bear?} when cookie? or grinch_friend? or heart_teddy_bear? ->
        {puzzle, location, :already_acquired_cookie}
      %Puzzle{cookie: false, inventory: inventory} ->
        inventory = [:cookie | inventory]
        puzzle = %{puzzle | cookie: true, last_bear_component: :cookie, inventory: inventory}
        {puzzle, location, :acquired_cookie}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "bag_of_pixie_dust") do
    case puzzle do
      %Puzzle{new_pixie_dust: new_pixie_dust?, grinch_friend: grinch_friend?, heart_teddy_bear: heart_teddy_bear?} when new_pixie_dust? or grinch_friend? or heart_teddy_bear? ->
        {puzzle, location, :already_acquired_new_pixie_dust}
      %Puzzle{cotton_balls: true, button: true, pink_stone: true, cookie: true, inventory: inventory} ->
        inventory = List.delete(inventory, :old_pixie_dust)
        inventory = [:new_pixie_dust | inventory]
        puzzle = %{puzzle | new_pixie_dust: true, old_pixie_dust: false, inventory: inventory}
        {puzzle, location, :acquired_new_pixie_dust}
      %Puzzle{old_pixie_dust: false, inventory: inventory} ->
        inventory = [:old_pixie_dust | inventory]
        puzzle = %{puzzle | old_pixie_dust: true, inventory: inventory}
        {puzzle, location, :acquired_old_pixie_dust}
      %Puzzle{old_pixie_dust: true} ->
        {puzzle, location, :already_acquired_old_pixie_dust}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "workbench") do
    case puzzle do
      %Puzzle{heart_teddy_bear: true} ->
        {puzzle, location, :already_acquired_heart_teddy_bear}
      %Puzzle{heart_teddy_bear: false, cotton_balls: true, button: true, pink_stone: true, cookie: true, old_pixie_dust: true, santas_magic_book: true} ->
        {puzzle, location, :not_fresh_pixie_dust}
      %Puzzle{heart_teddy_bear: false, cotton_balls: true, button: true, pink_stone: true, cookie: true, new_pixie_dust: true, santas_magic_book: true, inventory: inventory} ->
        inventory =
          inventory
          |> List.delete(:cotton_balls)
          |> List.delete(:button)
          |> List.delete(:pink_stone)
          |> List.delete(:cookie)
          |> List.delete(:new_pixie_dust)
          |> List.insert_at(0, :heart_teddy_bear)
        puzzle = %{puzzle | heart_teddy_bear: true, cotton_balls: false, button: false, pink_stone: false, cookie: false, new_pixie_dust: false, inventory: inventory}
        {puzzle, location, :acquired_heart_teddy_bear}
      %Puzzle{} ->
        {puzzle, location, :nothing_happens}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, location = "plant") do
    case puzzle do
      %Puzzle{heart_teddy_bear: true, grinch_friend: false, inventory: inventory} ->
        inventory =
          inventory
          |> List.delete(:heart_teddy_bear)
          |> List.insert_at(0, :grinch_friend)
        puzzle = %{puzzle | grinch_friend: true, heart_teddy_bear: false, inventory: inventory}
        {puzzle, location, :acquired_grinch_friend}
      %Puzzle{grinch_friend: true} ->
        {puzzle, location, :already_acquired_grinch_friend}
      %Puzzle{last_bear_component: component} when is_nil(component) ->
        {puzzle, location, :see_grinch}
      %Puzzle{last_bear_component: component, inventory: inventory} ->
        inventory = List.delete(inventory, component)
        puzzle =
          puzzle
          |> Map.put(component, false)
          |> Map.put(:last_bear_component, nil)
          |> Map.put(:inventory, inventory)
        {puzzle, location, {:grinch_stole_item, component}}
      _error ->
        {puzzle, nil, nil}
    end
  end

  def update(puzzle, _location) do
    {puzzle, nil, nil}
  end
end
