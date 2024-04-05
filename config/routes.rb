Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:new, :create, :index] do
    resources :items, only: [:index, :new, :create]
  end
  # ユーザーに紐づかないアイテムの管理用
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
end
