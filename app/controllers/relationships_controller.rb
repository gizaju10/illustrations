class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  #   def create
  #    @user = User.find(params[:relationship][:following_id])
  #    current_user.follow!(@user)
  #    redirect_to @user
  #  end
 
  #  def destroy
  #    @user = Relationship.find(params[:id]).following
  #    current_user.unfollow!(@user)
  #    redirect_to @user
  #  end

  def create
    @user = User.find(params[:following_id])
    current_user.follow!(@user)
  end

   def destroy
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
  end
end