class UsersController < ApplicationController

  def index
    @users = User.all
    # .page(params[:page]).per(1)
  end

  def show
    @user = User.find(params[:id])

    # @users = User.find(params[:id]).posts.includes(:taggings).page(params[:page]).per(1)
    @users = User.find(params[:id]).posts.page(params[:page]).per(1)
    
    # @users = Post.page(params[:page]).per(1)
    # @users = @user.posts.page(1).per(1)
    # @user = current_user
    # @posts = Post.where(user_id: params[:id]).count.per(1).order(created_at: :desc)
  end


  # フォロー関連
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def hide
    @user = User.find(params[:id]) #ユーザ毎の情報を得る
    @user.destroy #ユーザ情報を削除（退会）
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end

end