Rails.application.routes.draw do

  # Routes list
  #   lifts: index, show, create, update
  #   rules: index

  resources :lifts, only: :index
end
