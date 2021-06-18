Rails.application.routes.draw do
  get 'inquiry/index'
  get 'inquiry/confirm'
  get 'inquiry/thanks'
  get 'youtube/index'
  get 'youtube/search'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :relationships, only: %i[create destroy]
  resources :notifications, only: :index

  resources :users, only: %i[index show]
  put '/users/:id/hide' => 'users#hide', as: 'users_hide'
  resources :posts, only: %i[new index show create edit update destroy] do
    resources :comments, only: %i[create update edit destroy update]
    resources :likes, only: %i[create destroy]
  end

  get 'search' => 'posts#search' # 記事検索機能

  resources :users do
    member do
      get :following, :followers
    end
  end

  devise_scope :user do
    root to: 'devise/registrations#new'
  end

  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面
end
