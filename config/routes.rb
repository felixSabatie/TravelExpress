Rails.application.routes.draw do
  # Routes list
  #   lifts: index, show, create, update, destroy, search
  #   rules: index
  #   account: show, create, update

  namespace :api do
    post 'account_token' => 'account_token#create'
    get 'accounts/current' => 'accounts#current'
    resources :lifts, except: [:new, :edit]
    resources :rules, only: :index
    resources :accounts, only: [:show, :create, :update]
  end
end
