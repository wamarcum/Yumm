Rails.application.routes.draw do

  get 'employees/new'

  get 'employees/create'

  get 'employees/show'

  post "/signin", to: "sessions#create"
  get "/signin", to: "sessions#new"

  root "tables#index"

  resources :tables do
    resources :tickets
  end

  resources :employees

  #TODO
  #namespace :manager do
  #  resources :tables, :tickets, :employees
  #end
end

