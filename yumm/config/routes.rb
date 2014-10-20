Rails.application.routes.draw do

  post "/signin", to: "sessions#create"
  get "/signin", to: "sessions#new"

  root "tables#index"

  resources :tables do
    resources :tickets
  end
end

