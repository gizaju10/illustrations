class LikesController < ApplicationController
  before_action :authenticate_user!

def create
  @post = Post.find(params[:post_id])
  @like = current_user.likes.build(post_id: params[:post_id])
  # post.create_notification_like!(current_user)
  # @item.create_notification_by(current_user)
  @like.save
  @likeCounts = Like.where(post_id: params[:post_id])
end

def destroy
  @post = Post.find(params[:post_id])
  @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
  @like.destroy
  @likeCounts = Like.where(post_id: params[:post_id])
end

end