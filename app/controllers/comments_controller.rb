class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
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
      flash[:notice] = "投稿を編集しました"
      redirect_to("/")
    else
      render("/")
    end
  end

  # コメント編集→コメント削除
  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:notice] = "を削除しました"
    redirect_to("/")
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content, :post_id) #追加
    end
  end