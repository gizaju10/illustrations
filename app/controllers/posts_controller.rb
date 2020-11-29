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

  # 投稿編集
  def edit
    @post = Post.find_by(id: params[:id])
  end

  # 投稿編集→投稿更新
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/")
    else
      render("/")
    end
  end

  # 投稿編集→投稿削除
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/")
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end