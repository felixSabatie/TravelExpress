Rails.application.routes.draw do

  # Routes list
  #   lifts: index, show, create, update, destroy, search
  #   rules: index
  #   account: show, create, update

  resources :lifts, except: [:new, :edit]
  resources :rules, only: :index
  resources :accounts, only: [:show, :create, :update]
end
