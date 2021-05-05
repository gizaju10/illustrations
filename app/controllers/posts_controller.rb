class PostsController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_user!, only: [:index, :search, :create, :new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.page(params[:page]).per(1).order(created_at: :desc)
  end

  # 記事検索
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @posts_count = Post.search(params[:search]).count
    @posts = Post.search(params[:search]).page(params[:page]).per(1).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @new_posts = Time.now.at_beginning_of_day - 168.hour
    @comment = Comment.new
    @comments = @post.comments
    @like = Like.new # いいね機能
  end

  # 新規投稿
  def new
    @post = Post.new
    @tags = ActsAsTaggableOn::Tag.all
  end

  # 新規投稿→投稿送信
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿を作成しました。"
      # redirect_to("/posts")
      redirect_to @post
    else
      flash.now[:alert] = "投稿に失敗しました。"
      @tags = ActsAsTaggableOn::Tag.all
      render("/posts/new")
    end
  end

  # 投稿編集
  def edit
    @post = Post.find_by(id: params[:id])
  end

  # 投稿編集→投稿更新
  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました。"
      redirect_to @post
    else
      render :new
    end
  end

  # 投稿編集→投稿削除
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to("/posts")
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, category_list: [], occupation_list: [], target_list: [])
  end
end