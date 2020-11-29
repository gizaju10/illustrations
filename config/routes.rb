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
  put "/users/:id/hide" => "users#hide", as: 'users_hide'
  resources :posts, only: [:index, :show, :create, :edit] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  post "posts/:id/update" => "posts#update" # 投稿編集→投稿更新
  post "posts/:id/destroy" => "posts#destroy" # 投稿編集→投稿削除

  get "comments/:id/edit" => "comments#edit" # 投稿編集
  post "comments/:id/update" => "comments#update" # コメント編集→コメント更新
  post "comments/:id/destroy" => "comments#destroy" # コメント編集→コメント削除

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
