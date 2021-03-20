class PostsController < ApplicationController
  before_action :authenticate_user!
  # , only: [:show, :create] # ログインしていないユーザーはshow, createは実行できない

  def index
    # @posts = Post.all
    @posts = Post.page(params[:page]).per(1).order(created_at: :desc)
    # @posts = Post.page(params[:page]).order(created_at: :desc).without_count.per(1)
    # Post.find_by(id: 1).occupation_list
    # @post = Post.new
    # 1/19にコメント化　# if params[:tag_name]
      # @path = request.fullpath.include?("tag_name")
    # 1/19にコメント化  # @posts = Post.tagged_with("#{params[:tag_name]}").page(params[:page]).per(1).order(created_at: :desc)
    # 1/19にコメント化　# end
  end

  # 記事検索
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search]).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @new_posts = Time.now.at_beginning_of_day - 72.hour
    # @comments = @post.comments # コメント機能
    # @comment = Comment.new # コメント機能
    # @comment = Comment.new
    @comment = Comment.new
    # @comment = @post.comments.build
    #新着順で表示
    @comments = @post.comments
    # @comments = @post.comments.order(created_at: :desc)
    # @comments = @post.comments.order(created_at: :desc).page(params[:page]).per(1)
    # @comments = @post.comments.page(params[:page]).per(1)
    @like = Like.new # いいね機能
  end

  # 新規投稿
  def new
    @post = Post.new

    # 追加
    @tags = ActsAsTaggableOn::Tag.all
    # @categories = ActsAsTaggableOn::Tag.named_any(["知識", "技術", "メンタル", "その他カテゴリー"])
    # @occupations = ActsAsTaggableOn::Tag.named_any(["漫画家", "イラストレーター", "キャラクターデザイナー", "コンセプトアーティスト", "アニメーター", "絵本作家", "その他職種"])
    # @targets = ActsAsTaggableOn::Tag.named_any(["初心者", "中級者", "上級者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"])
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

      # 追加
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
    # @post.content = params[:content]
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました。"
      # redirect_back(fallback_location: root_path)
      redirect_to @post
    else
      render :new
    end
  end

  # def update
  #   @post = Post.find(params[:id])
  #   if @post.update(post_params)
  #     redirect_to request.referer
  #   else
  #     render :new
  #   end
  # end

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