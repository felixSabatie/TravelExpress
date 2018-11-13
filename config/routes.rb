Rails.application.routes.draw do
  # Routes list
  #   lifts: index, show, create, update, destroy, search
  #   rules: index
  #   account: show, create, update

  namespace :api do
    post '/account_token' => 'account_token#create'
    get '/accounts/current' => 'accounts#current'
    get '/lifts/search' => 'lifts#search'
    resources :lifts, except: [:new, :edit]
    post '/lifts/:id/reservations' => 'lifts#add_reservation'
    resources :rules, only: :index
    resources :accounts, only: [:show, :create, :update]
  end

  get '*path', to: 'static_files#index'
end
