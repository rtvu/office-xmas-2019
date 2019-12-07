defmodule PuzzleChallengeWeb.Router do
  use PuzzleChallengeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PuzzleChallengeWeb do
    pipe_through :browser

    get "/", HomeController, :index
    get "/enable_links", EnableLinksController, :index
    get "/disable_links", DisableLinksController, :index
    delete "/restart", RestartController, :delete
  end
end
