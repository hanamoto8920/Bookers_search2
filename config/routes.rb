Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ブックモデルのルーティング
  # ブックコントローラ
  resources :books, only: [:edit, :create, :index, :show, :update, :destroy]

  # # ホームのコントローラ
  root "homes#top"
  get "home/about" => "homes#index"


  # ユーザーモデルのルーティング
  # ユーザーコントローラ
  resources :users, only: [:show, :edit, :update, :index]
  
  # サーチアクション
  get "search" => "search#search"

end

