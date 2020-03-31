Rails.application.routes.draw do

   # ユーザー
  devise_for :users
  root to: 'posts#index'
  get 'users/:id/mypage' => 'users#mypage', as: 'mypage'
  get 'posts/index/result' => 'posts#index_result', as: 'index_result'
  resources :users, only: [:edit, :update]
  resources :categories, only: [:create]
  # get 'posts/index/result' => 'posts#index_result', as: 'index_result'
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :comments, only: [:create]
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

