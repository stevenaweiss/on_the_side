OnTheSide::Application.routes.draw do

  resources :users

  resources :ingredients do
    member do
      post :neighborhood
    end
  end
  # get "/ingredients", to: "ingredients#search"
  # post "/ingredients", to: "ingredients#search"


  get "/login", to: "sessions#new"
  post "/session", to: "sessions#create"
  delete "/session", to: "sessions#destroy"


  root "welcome#index"
end
