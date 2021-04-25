class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    #投稿に紐づいたコメントを作成
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  # コメント編集
  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  # 投稿編集→投稿更新
  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.content = params[:content]
    if @comment.save
      flash[:notice] = "コメントを編集しました。"
      redirect_to("/posts/#{@comment.post_id}")
    else
      flash[:alert] = "コメントを編集できませんでした。"
      redirect_back(fallback_location: @post)
    end
  end

  # コメント編集→コメント削除
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id) #追加
    end
  end