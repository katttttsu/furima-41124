Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root 'items#index'
  post 'posts', to: 'posts#create'
  resources :items
end
