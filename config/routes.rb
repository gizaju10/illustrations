Rails.application.routes.draw do
  get 'inquiry/index'
  get 'inquiry/confirm'
  get 'inquiry/thanks'
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

  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
