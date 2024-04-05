#Rails.application.routes.draw do
#  root 'home#index'
#  resources :users, only: [:new, :create, :index] do
#    resources :items, only: [:index, :new, :create]
#  end
#  # ユーザーに紐づかないアイテムの管理用
#  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
#end
Rails.application.routes.draw do
  root 'home#index'
  
  resources :users, only: [:new, :create, :index] do
    resources :items, only: [:index, :new, :create]
  end
  
  # ユーザーに紐づかないアイテムの管理用ルーティング
  # `index`アクションを含めるように修正
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      post 'select_user', to: 'items#select_user', as: 'select_user'
    end
  end
end
