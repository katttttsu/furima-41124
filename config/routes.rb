Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :purchase_histories, only: [ :new, :create, :show]
  end
  resources :users, only: :create
end
