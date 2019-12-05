defmodule PuzzleChallengeWeb.HomeView do
  use PuzzleChallengeWeb, :view

  @image_map %{
    santas_workshop: "/images/santas_workshop.svg",
    flashlight: "/images/flashlight.svg",
    pickaxe: "/images/pickaxe.svg",
    magic_glasses: "/images/magic_glasses.svg"
  }

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
        {"magic_glasses", :already_acquired_magic_glasses} ->
          image_path = @image_map[:magic_glasses]
          message = "You already have a pair of magical glasses."
          make_card_parameters(image_path, message)
      end
    end
  end

  defp make_card_parameters(image_path, message) do
    message =
      message
      |> text_to_html()
    {image_path, message}
  end

  defp get_image_path(item) do
    @image_map[item]
  end
end
