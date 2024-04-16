Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:new, :create, :index, :destroy]
  resources :items, only: [:index, :new, :create, :show]
  resources :item_masters, only: [:index, :new, :create, :show]
  get 'select_user', to: 'items#select_user'
end
