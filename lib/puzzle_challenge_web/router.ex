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
    delete "/restart", RestartController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", PuzzleChallengeWeb do
  #   pipe_through :api
  # end
end
