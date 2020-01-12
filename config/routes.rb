Rails.application.routes.draw do
  root'homes#top'
  get 'home/about',to: "homes#about", as: "home_about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #ログイン認証されていなければ、ログイン画面へリダイレクト
  # before_action :authenticate_user!

  # ログイン認証が成功した後、投稿画像の一覧画面を表示(3章) 書く必要ある？
  # root 'users#index'


  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :create, :show, :edit, :update]


end
