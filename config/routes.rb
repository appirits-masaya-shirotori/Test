Rails.application.routes.draw do
  root 'home#index'
  
  resources :users, only: [:new, :create, :index, :destroy, :show]
  resources :item_masters, only: [:index, :new, :create, :show, :edit, :destroy]
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users do
      resources :items, only: [:index]
    end
    get 'select_user', to: 'items#select_user'
end
