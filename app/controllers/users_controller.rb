class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).order(created_at: :desc).per(4)
  end

  def show
    @user = User.find(params[:id])
    @users = @user.posts.page(params[:page]).order(created_at: :desc).per(1)
    @user_counts = @user.liked_posts.includes(:user).count
    @user_favorites = @user.liked_posts.includes(:taggings, :user).order('RANDOM()').limit(2)
  end

  # フォロー関連
  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def hide
    @user = User.find(params[:id]) # ユーザ毎の情報を得る
    @user.destroy # ユーザ情報を削除（退会）
    flash[:notice] = 'ありがとうございました。またのご利用を心よりお待ちしております。'
    redirect_to root_path
  end
end
