Rails.application.routes.draw do

   # ユーザー
  devise_for :users
  root to: 'posts#index'
  get 'users/:id/mypage' => 'users#mypage', as: 'mypage'
  get 'users/:id/exit' => 'users#exit', as: 'exit'
  resources :users, only: [:edit, :update]
  resources :comments, only: [:create, :destroy]
  resources :posts, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :categories, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
