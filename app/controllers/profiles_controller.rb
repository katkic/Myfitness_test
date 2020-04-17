class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit]
  before_action :set_profile, only: :update

  def index
    @users = User.all
  end

  def show
    @post_count = @user.posts.count
    @following_count = @user.following.count
    @followers_count = @user.followers.count
  end

  def new;end

  def edit;end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(current_user)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :user_id,
      :header_image,
      :icon,
      :height,
      :public_flag,
      :self_introduction
    )
  end

  def set_user
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
