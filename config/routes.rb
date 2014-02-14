OnTheSide::Application.routes.draw do

  resources :users



  root "welcome#index"
end
