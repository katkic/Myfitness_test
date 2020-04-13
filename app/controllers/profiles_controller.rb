class ProfilesController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.all
  end

  def show
    @post_count = @user.posts.count
    @following_count = @user.following.count
    @followers_count = @user.followers.count
  end

  def new
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
