class RelationshipsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @flag = params[:flag]
    @following = @user.following
    @followers = @user.followers
  end

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
  end
end
