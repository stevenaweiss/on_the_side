OnTheSide::Application.routes.draw do

  resources :users

  resources :ingredients do
    member do
      post :neighborhood
    end
  end

  resources :restaurants

  get "/login", to: "sessions#new"
  post "/session", to: "sessions#create"
  delete "/session", to: "sessions#destroy"


  root "welcome#index"
end
