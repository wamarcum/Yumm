Rails.application.routes.draw do
  root "tables#index"

  post "/signin", to: "sessions#create"
  get "/signin", to: "sessions#new"
  delete "/signout", to: "sessions#destroy"

  namespace :manager do
    root to: "base#index"
    resources :employees, :items
  end

  resources :employees

  resources :tables do
    resources :tickets
  end

  resources :tickets do
    resources :items
  end

  #TODO
  #namespace :manager do
  #  resources :tables, :tickets, :employees
  #end
end

