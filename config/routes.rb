Rails.application.routes.draw do
  # get 'posts/index'
  # get 'posts/show'
  # get 'users/index'
  # get 'users/show'
  # devise_for :users

  devise_for :users

  resources :relationships, only: [:create, :destroy]

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # フォロー関連ここから
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  # フォロー関連ここまで

  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
