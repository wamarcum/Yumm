Rails.application.routes.draw do
  root "tables#index"

  post "/signin", to: "sessions#create"
  get "/signin", to: "sessions#new"

  namespace :manager do
    root to: "base#index"
    resources :employees
  end

  resources :employees

  resources :tables do
    resources :tickets
  end

  #TODO
  #namespace :manager do
  #  resources :tables, :tickets, :employees
  #end
end

