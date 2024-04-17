Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:new, :create, :index]
  resources :item_masters, only: [:new, :create]
  resources :items, only: [:index, :new, :create, :show]
end
