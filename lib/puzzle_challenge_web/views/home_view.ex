defmodule PuzzleChallengeWeb.HomeView do
  use PuzzleChallengeWeb, :view

  @image_map %{
    santas_workshop: "/images/santas_workshop.svg",
    flashlight: "/images/flashlight.svg",
    pickaxe: "/images/pickaxe.svg",
    magic_glasses: "/images/magic_glasses.svg",
    picture_frame: "/images/picture_frame.svg",
    magic_effect: "/images/magic_effect.gif",
    dark_cloud: "/images/dark_cloud.svg",
    nothing: "/images/nothing.svg",
    key: "/images/key.svg",
    dust_balls: "/images/dust_balls.svg",
    cotton_balls: "/images/cotton_balls.svg",
    locked_chest: "/images/locked_chest.svg",
    opened_chest: "/images/opened_chest.svg",
    reindeer_treats: "/images/reindeer_treats.svg",
    coal: "/images/coal.svg",
    present: "/images/present.svg",
    santas_magic_book: "/images/santas_magic_book.svg",
    button: "/images/button.svg",
    buttons: "/images/buttons.svg",
    big_rock: "/images/big_rock.svg",
    broken_rocks: "/images/broken_rocks.svg",
    pink_stone: "/images/pink_stone.svg",
    cookie: "/images/cookie.svg",
    cookies: "/images/cookies.svg",
    new_pixie_dust: "/images/pixie_dust.svg",
    old_pixie_dust: "/images/pixie_dust.svg",
    workbench: "/images/workbench.svg",
    heart_teddy_bear: "/images/heart_teddy_bear.svg",
    grinch_friend: "/images/grinch_friend.svg",
    grinch: "/images/grinch.svg",
    grinch_steal: "/images/grinch_steal.svg"
  }

  defp get_card_parameters(assigns) do
    location = assigns[:location]
    if is_nil(location) do
      image_path = @image_map[:santas_workshop]
      message = "The Grinch is hiding in Santa's Workshop and has locked away Santa's reindeer treats.\n\nHelp Santa find the treats and help the Grinch get into the Christmas spirit."
      {image_path, message}
    else
      options = assigns[:options]
      case {location, options} do
        {"flashlight", :acquired_flashlight} ->
          image_path = @image_map[:flashlight]
          message = "Nothing can hide in the dark now that you have this flashlight."
          {image_path, message}
        {"flashlight", :already_acquired_flashlight} ->
          image_path = @image_map[:flashlight]
          message = "You already have a flashlight."
          {image_path, message}
        {"pickaxe", :acquired_pickaxe} ->
          image_path = @image_map[:pickaxe]
          message = "This pickaxe will be useful for breaking rocks."
          {image_path, message}
        {"pickaxe", :already_acquired_pickaxe} ->
          image_path = @image_map[:pickaxe]
          message = "You already have a pickaxe."
          {image_path, message}
        {"magic_glasses", :acquired_magic_glasses} ->
          image_path = @image_map[:magic_glasses]
          message = "This pair of glasses seems magical. Wonder what it can do?"
          {image_path, message}
        {"magic_glasses", :already_acquired_magic_glasses} ->
          image_path = @image_map[:magic_glasses]
          message = "You already have a pair of glasses."
          {image_path, message}
        {"picture_frame_" <> _rest, :missing_magic_glasses} ->
          image_path = @image_map[:picture_frame]
          message = "This picture shows a pair of glasses."
          {image_path, message}
        {"picture_frame_a", :have_magic_glasses} ->
          image_path = @image_map[:magic_effect]
          message = "Cotton balls can be found on a shelf.\nButtons can be found on a pillow.\nPink stones can be found in rocks.\nCookies can be found in jars.\nPixie dust can be found in bags."
          {image_path, message}
        {"picture_frame_b", :have_magic_glasses} ->
          image_path = @image_map[:magic_effect]
          message = "Flashlights and pickaxes are useful. You should find these items."
          {image_path, message}
        {"picture_frame_c", :have_magic_glasses} ->
          image_path = @image_map[:magic_effect]
          message = "The Grinch hid a key in one of the shelves."
          {image_path, message}
        {"dark_area_" <> _rest, :cannot_see} ->
          image_path = @image_map[:dark_cloud]
          message = "You cannot see inside dark places."
          {image_path, message}
        {"dark_area_" <> _rest, :nothing_to_see} ->
          image_path = @image_map[:nothing]
          message = "There is nothing here."
          {image_path, message}
        {"dark_area_b", :acquired_key} ->
          image_path = @image_map[:key]
          message = "You found a key."
          {image_path, message}
        {"dark_area_c", :acquired_dust_balls} ->
          image_path = @image_map[:dust_balls]
          message = "You found some dust bunnies."
          {image_path, message}
        {"dark_area_c", :acquired_more_dust_balls} ->
          image_path = @image_map[:dust_balls]
          message = "You found more dust bunnies."
          {image_path, message}
        {"dark_area_d", :left_additional_cotton_balls} ->
          image_path = @image_map[:cotton_balls]
          message = "There are more cotton balls. You did not take anymore."
          {image_path, message}
        {"dark_area_d", :acquired_cotton_balls} ->
          image_path = @image_map[:cotton_balls]
          message = "You found some cotton balls."
          {image_path, message}
        {"locked_chest", :no_key} ->
          image_path = @image_map[:locked_chest]
          message = "This chest is locked."
          {image_path, message}
        {"locked_chest", :opened_chest} ->
          image_path = @image_map[:opened_chest]
          message = "Hurray, Santa's reindeers will be so happy."
          {image_path, message}
        {"locked_chest", :already_opened_chest} ->
          image_path = @image_map[:opened_chest]
          message = "There are plenty of treats for Santa's reindeers."
          {image_path, message}
        {"coal", :acquired_coal} ->
          image_path = @image_map[:coal]
          message = "You took a lump of coal."
          {image_path, message}
        {"coal", :acquired_more_coal} ->
          image_path = @image_map[:coal]
          message = "You took another lump of coal."
          {image_path, message}
        {"present", :someones_present} ->
          image_path = @image_map[:present]
          message = "This is someone's present. You did not take the present."
          {image_path, message}
        {"santas_magic_book", :acquired_santas_magic_book} ->
          image_path = @image_map[:santas_magic_book]
          message = "You found Santa's Magic Toy Making Book.\n\nReading... reading...\n\nTo make a Heart Teddy Bear, you will need a button, a pink stone, a cookie, cotton balls, and fresh heart pixie dust.\n\nWhere can these items be?"
          {image_path, message}
        {"santas_magic_book", :already_acquired_santas_magic_book} ->
          image_path = @image_map[:santas_magic_book]
          message = "Reading... reading...\n\nTo make a Heart Teddy Bear, you will need a button, a pink stone, a cookie, cotton balls, and fresh heart pixie dust."
          {image_path, message}
        {"button_pillow", :already_acquired_button} ->
          image_path = @image_map[:buttons]
          message = "There are many buttons. You did not take another button."
          {image_path, message}
        {"button_pillow", :acquired_button} ->
          image_path = @image_map[:button]
          message = "You took a button."
          {image_path, message}
        {"rock_" <> _rest, :cannot_break_rock} ->
          image_path = @image_map[:big_rock]
          message = "You'll need a tool to break these rocks."
          {image_path, message}
        {"rock_" <> _rest, :broke_rock} ->
          image_path = @image_map[:broken_rocks]
          message = "The rock broke into pieces from the pickaxe."
          {image_path, message}
        {"rock_a", :acquired_pink_stone} ->
          image_path = @image_map[:pink_stone]
          message = "The rock broke into pieces from the pickaxe. You found a pink stone inside."
          {image_path, message}
        {"jar", :already_acquired_cookie} ->
          image_path = @image_map[:cookies]
          message = "You already have a cookie."
          {image_path, message}
        {"jar", :acquired_cookie} ->
          image_path = @image_map[:cookie]
          message = "You took a cookie."
          {image_path, message}
        {"bag_of_pixie_dust", :already_acquired_new_pixie_dust} ->
          image_path = @image_map[:new_pixie_dust]
          message = "You don't need anymore heart pixie dust."
          {image_path, message}
        {"bag_of_pixie_dust", :already_acquired_old_pixie_dust} ->
          image_path = @image_map[:old_pixie_dust]
          message = "You took some more heart pixie dust."
          {image_path, message}
        {"bag_of_pixie_dust", :acquired_old_pixie_dust} ->
          image_path = @image_map[:old_pixie_dust]
          message = "You found some heart pixie dust."
          {image_path, message}
        {"bag_of_pixie_dust", :acquired_new_pixie_dust} ->
          image_path = @image_map[:new_pixie_dust]
          message = "You found some fresh heart pixie dust."
          {image_path, message}
        {"workbench", :already_acquired_heart_teddy_bear} ->
          image_path = @image_map[:heart_teddy_bear]
          message = "The Heart Teddy Bear is so fluffy."
          {image_path, message}
        {"workbench", :not_fresh_pixie_dust} ->
          image_path = @image_map[:workbench]
          message = "Following the instructions in Santa's Magic Toy Making Book.\n\nYou put the necessary ingredients on the workbench...\n\nBut nothing happened. Is your heart pixie dust fresh?"
          {image_path, message}
        {"workbench", :acquired_heart_teddy_bear} ->
          image_path = @image_map[:heart_teddy_bear]
          message = "Following the instructions in Santa's Magic Toy Making Book.\n\nYou put the necessary ingredients on the workbench...\n\nA Heart Teddy Bear is made!!!"
          {image_path, message}
        {"workbench", :nothing_happens} ->
          image_path = @image_map[:workbench]
          message = "Many toys have been made on this workbench."
          {image_path, message}
        {"plant", :acquired_grinch_friend} ->
          image_path = @image_map[:grinch_friend]
          message = "You gave the Heart Teddy Bear to the Grinch as a gift. You are now the best of friends."
          {image_path, message}
        {"plant", :already_acquired_grinch_friend} ->
          image_path = @image_map[:grinch_friend]
          message = "You and the Grinch are playing by the plant."
          {image_path, message}
        {"plant", :see_grinch} ->
          image_path = @image_map[:grinch]
          message = "You see the Grinch hiding behind the plant."
          {image_path, message}
        {"plant", {:grinch_stole_item, component}} ->
          image_path = @image_map[:grinch]
          message = "The Grinch is hiding behind the plant, he stole your #{component |> Atom.to_string() |> String.replace("_", " ")}."
          {image_path, message}
        _error ->
          image_path = @image_map[:santas_workshop]
          message = "The Grinch is hiding in Santa's Workshop and has locked away Santa's reindeer treats.\n\nHelp Santa find the treats and help the Grinch get into the Christmas spirit."
          {image_path, message}
      end
    end
  end

  defp get_image_path(item) do
    @image_map[item]
  end
end
