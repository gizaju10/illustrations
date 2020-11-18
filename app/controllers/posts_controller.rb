class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create] # ログインしていないユーザーはshow, createは実行できない
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments # コメント機能
    @comment = Comment.new # コメント機能
    @like = Like.new # いいね機能
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end