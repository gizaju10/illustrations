Rails.application.routes.draw do
  # get 'posts/index'
  # get 'posts/show'
  # get 'users/index'
  # get 'users/show'
  # devise_for :users

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create]

  root 'posts#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
