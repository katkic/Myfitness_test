class BodyStatusesController < ApplicationController
  before_action :set_body_status, only: %i[show edit update destroy]

  def index
    @body_statuses = BodyStatus.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show;end

  def new
    @body_status = BodyStatus.new
  end

  def create
    @body_status = current_user.body_statuses.build(body_status_params)

    if @body_status.save
      redirect_to body_status_path(@body_status), notice: "体重・体脂肪「#{@body_status.created_at.strftime("%Y-%m-%d %H:%M")}」を記録しました"
    else
      render :new
    end
  end

  def edit;end

  def update
    if @body_status.update(body_status_params)
      redirect_to body_status_path(@body_status), notice: "体重・体脂肪「#{@body_status.created_at.strftime("%Y-%m-%d %H:%M")}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @body_status.destroy
    redirect_to body_statuses_path, notice: "体重・体脂肪「#{@body_status.created_at.strftime("%Y-%m-%d %H:%M")}を削除しました」"
  end

  private

  def body_status_params
    params.require(:body_status).permit(
      :created_at,
      :body_weight,
      :body_fat,
      :picture1,
      :picture2,
      :picture3,
      :picture1_cache,
      :picture2_cache,
      :picture3_cache,
      :remove_picture1,
      :remove_picture2,
      :remove_picture3
    )
  end

  def set_body_status
    @body_status = BodyStatus.find(params[:id])
  end
end
