defmodule PuzzleChallengeWeb.HomeView do
  use PuzzleChallengeWeb, :view

  @image_map %{
    santas_workshop: "/images/santas_workshop.svg",
    flashlight: "/images/flashlight.svg",
    pickaxe: "/images/pickaxe.svg",
    magic_glasses: "/images/magic_glasses.svg",
    picture_frame: "/images/picture_frame.svg",
    magic_effect: "/images/magic_effect.svg",
    dark_cloud: "/images/dark_cloud.svg",
    nothing: "/images/nothing.svg",
    key: "/images/key.svg",
    dust_balls: "/images/dust_balls.svg",
    cotton_balls: "/images/cotton_balls.svg",
    locked_chest: "/images/locked_chest.svg",
    opened_chest: "/images/opened_chest.svg",
    reindeer_treats: "/images/reindeer_treats.svg",
    coal: "/images/coal.svg",
    santas_magic_book: "/images/santas_magic_book.svg",
    button: "/images/button.svg",
    buttons: "/images/buttons.svg",
    big_rock: "/images/big_rock.svg",
    broken_rocks: "/images/broken_rocks.svg",
    pink_stone: "/images/pink_stone.svg",
    cookie: "/images/cookie.svg",
    new_pixie_dust: "/images/pixie_dust.svg",
    old_pixie_dust: "/images/pixie_dust.svg",
    pixie_dust: "/images/pixie_dust.svg",
    workbench: "/images/workbench.svg",
    heart_teddy_bear: "/images/heart_teddy_bear.svg",
    grinch_friend: "/images/grinch_friend.svg",
    grinch: "/images/grinch.svg",
    grinch_steal: "/images/grinch_steal.svg"
  }




  # new_pixie_dust: false,
  # old_pixie_dust: false,
  # heart_teddy_bear: false,
  # grinch_friend: false,



  defp get_card_parameters(assigns) do
    location = assigns[:location]
    if is_nil(location) do
      image_path = @image_map[:santas_workshop]
      message = "The Grinch is hiding in Santa's Workshop and has locked away Santa's reindeer treats.\n\nHelp Santa find the treats and help the Grinch get into the Christmas spirit"
      make_card_parameters(image_path, message)
    else
      puzzle = assigns[:puzzle]
      location = assigns[:location]
      options = assigns[:options]
      case {location, options} do
        {"flashlight", :acquired_flashlight} ->
          image_path = @image_map[:flashlight]
          message = "The dark isn’t scary now that you have a flashlight."
          make_card_parameters(image_path, message)
        {"flashlight", :already_acquired_flashlight} ->
          image_path = @image_map[:flashlight]
          message = "You already have a flashlight."
          make_card_parameters(image_path, message)
        {"pickaxe", :acquired_pickaxe} ->
          image_path = @image_map[:pickaxe]
          message = "This pickaxe will be useful for breaking rocks."
          make_card_parameters(image_path, message)
        {"pickaxe", :already_acquired_pickaxe} ->
          image_path = @image_map[:pickaxe]
          message = "You already have a pickaxe."
          make_card_parameters(image_path, message)
        {"magic_glasses", :acquired_magic_glasses} ->
          image_path = @image_map[:magic_glasses]
          message = "This pair of glasses seem magical. Wonder what it can do?"
          make_card_parameters(image_path, message)
        {"picture_frame_" <> _rest, :missing_magic_glasses} ->
          image_path = @image_map[:picture_frame]
          message = "This picture shows a pair of glasses."
          make_card_parameters(image_path, message)
        {"picture_frame_a", :have_magic_glasses} ->
          image_path = @image_map[:magic_effect]
          message = "HINT A - to be TBD."
          make_card_parameters(image_path, message)
        {"picture_frame_b", :have_magic_glasses} ->
          image_path = @image_map[:magic_effect]
          message = "HINT B - to be TBD."
          make_card_parameters(image_path, message)
        {"picture_frame_c", :have_magic_glasses} ->
          image_path = @image_map[:magic_effect]
          message = "HINT C - to be TBD."
          make_card_parameters(image_path, message)
        {"dark_area_" <> _rest, :cannot_see} ->
          image_path = @image_map[:dark_cloud]
          message = "You cannot see inside that dark spot."
          make_card_parameters(image_path, message)
        {"dark_area_" <> _rest, :nothing_to_see} ->
          image_path = @image_map[:nothing]
          message = "There is nothing here."
          make_card_parameters(image_path, message)
        {"dark_area_b", :acquired_key} ->
          image_path = @image_map[:key]
          message = "You found a key."
          make_card_parameters(image_path, message)
        {"dark_area_c", :acquired_dust_balls} ->
          image_path = @image_map[:dust_balls]
          message = "You found some dust balls."
          make_card_parameters(image_path, message)
        {"dark_area_c", :acquired_more_dust_balls} ->
          image_path = @image_map[:dust_balls]
          message = "You got more dust balls."
          make_card_parameters(image_path, message)
        {"dark_area_d", :left_additional_cotton_balls} ->
          image_path = @image_map[:cotton_balls]
          message = "There are more cotton balls. You did not take anymore."
          make_card_parameters(image_path, message)
        {"dark_area_d", :acquired_cotton_balls} ->
          image_path = @image_map[:cotton_balls]
          message = "You found some cotton balls."
          make_card_parameters(image_path, message)
        {"locked_chest", :no_key} ->
          image_path = @image_map[:locked_chest]
          message = "This chest is locked."
          make_card_parameters(image_path, message)
        {"locked_chest", :opened_chest} ->
          image_path = @image_map[:opened_chest]
          message = "Hurray, Santa's reindeers will be so happy."
          make_card_parameters(image_path, message)
        {"locked_chest", :already_opened_chest} ->
          image_path = @image_map[:opened_chest]
          message = "There are plenty of treats for Santa's reindeers."
          make_card_parameters(image_path, message)
        {"coal", :acquired_coal} ->
          image_path = @image_map[:coal]
          message = "You took a lump of coal."
          make_card_parameters(image_path, message)
        {"coal", :acquired_more_coal} ->
          image_path = @image_map[:coal]
          message = "You took another lump of coal."
          make_card_parameters(image_path, message)
        {"santas_magic_book", :acquired_santas_magic_book} ->
          image_path = @image_map[:santas_magic_book]
          message = "You grabbed Santa's Magic Toy Making Book.\n\nReading... reading...\n\nTo make a Heart Teddy Bear, you will need a button, a pink stone, a cookie, cotton balls, and fresh heart pixie dust."
          make_card_parameters(image_path, message)
        {"santas_magic_book", :already_acquired_santas_magic_book} ->
          image_path = @image_map[:santas_magic_book]
          message = "Reading... reading...\n\nTo make a Heart Teddy Bear, you will need a button, a pink stone, a cookie, cotton balls, and fresh heart pixie dust."
          make_card_parameters(image_path, message)
        {"button_pillow", :already_acquired_button} ->
          image_path = @image_map[:buttons]
          message = "There are many buttons. You did not take another button."
          make_card_parameters(image_path, message)
        {"button_pillow", :acquired_button} ->
          image_path = @image_map[:button]
          message = "You took a button."
          make_card_parameters(image_path, message)
        {"rock_" <> _rest, :cannot_break_rock} ->
          image_path = @image_map[:big_rock]
          message = "You'll need a tool to break this rock."
          make_card_parameters(image_path, message)
        {"rock_" <> _rest, :broke_rock} ->
          image_path = @image_map[:broken_rocks]
          message = "The rock broke into pieces."
          make_card_parameters(image_path, message)
        {"rock_a", :acquired_pink_stone} ->
          image_path = @image_map[:pink_stone]
          message = "You found a pink stone."
          make_card_parameters(image_path, message)
        {"jar", :already_acquired_cookie} ->
          image_path = @image_map[:cookie]
          message = "You already have a cookie."
          make_card_parameters(image_path, message)
        {"jar", :acquired_cookie} ->
          image_path = @image_map[:cookie]
          message = "You took a cookie."
          make_card_parameters(image_path, message)
        {"bag_of_pixie_dust", :already_acquired_new_pixie_dust} ->
          image_path = @image_map[:new_pixie_dust]
          message = "You don't need more heart pixie dust."
          make_card_parameters(image_path, message)
        {"bag_of_pixie_dust", :already_acquired_old_pixie_dust} ->
          image_path = @image_map[:old_pixie_dust]
          message = "You took some more heart pixie dust."
          make_card_parameters(image_path, message)
        {"bag_of_pixie_dust", _options} ->
          image_path = @image_map[:pixie_dust]
          message = "You found some heart pixie dust."
          make_card_parameters(image_path, message)
        {"workbench", :already_acquired_heart_teddy_bear} ->
          image_path = @image_map[:heart_teddy_bear]
          message = "The Heart Teddy Bear is so fluffy."
          make_card_parameters(image_path, message)
        {"workbench", :old_pixie_dust} ->
          image_path = @image_map[:workbench]
          message = "Following the instructions in Santa's Magic Toy Making Book and the components that you've gather...\n\nNothing happened. Is your heart pixie dust fresh?"
          make_card_parameters(image_path, message)
        {"workbench", :acquired_heart_teddy_bear} ->
          image_path = @image_map[:heart_teddy_bear]
          message = "Following the instructions in Santa's Magic Toy Making Book and the components that you've gather...\n\nYou made a Heart Teddy Bear!!!"
          make_card_parameters(image_path, message)
        {"workbench", :nothing_happens} ->
          image_path = @image_map[:workbench]
          message = "Many toys have been made at this workbench."
          make_card_parameters(image_path, message)
        {"plant", :acquired_grinch_friend} ->
          image_path = @image_map[:grinch_friend]
          message = "You gave your Heart Teddy Bear to the Grinch as a gift. You are now the best of friends."
          make_card_parameters(image_path, message)
        {"plant", :already_acquired_grinch_friend} ->
          image_path = @image_map[:grinch_friend]
          message = "You and the Grinch are playing by the plant."
          make_card_parameters(image_path, message)
        {"plant", :see_grinch} ->
          image_path = @image_map[:grinch]
          message = "You investigate the plant and see the Grinch hiding."
          make_card_parameters(image_path, message)
        {"plant", {:grinch_stole_item, component}} ->
          image_path = @image_map[:grinch]
          message = "You investigate the plant and the Grinch stole your #{component |> Atom.to_string() |> String.replace("_", " ")}."
          make_card_parameters(image_path, message)
      end
    end
  end

  defp make_card_parameters(image_path, message) do
    message =
      message
      |> text_to_html(attributes: [class: "card-text"])
    {image_path, message}
  end

  defp get_image_path(item) do
    @image_map[item]
  end
end
