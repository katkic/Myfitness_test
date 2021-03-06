class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit]
  before_action :set_profile, only: :update

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(id: :asc).page(params[:page]).per(20)
  end

  def show
    @posts = @user.posts.page(params[:page]).per(5)
    @post_count = @user.posts.count
    @following_count = @user.following.count
    @followers_count = @user.followers.count
  end

  def new;end

  def edit;end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(current_user), notice: "「#{@profile.user.name}」のプロフィールを更新しました"
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
      :self_introduction,
      :remove_header_image,
      :remove_icon
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
