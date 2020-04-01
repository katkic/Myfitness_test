class BodyStatusesController < ApplicationController
  before_action :set_body_status, only: [:show]

  def index
    @body_statuses = BodyStatus.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show;end

  def new
  end

  def edit
  end

  private

  def set_body_status
    @body_status = BodyStatus.find(params[:id])
  end
end
