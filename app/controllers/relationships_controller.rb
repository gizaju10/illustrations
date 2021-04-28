class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:following_id])
    current_user.follow!(@user)
  end

   def destroy
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
  end
end