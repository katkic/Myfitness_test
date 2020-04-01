class BodyStatusesController < ApplicationController
  def index
    @body_statuses = BodyStatus.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
  end

  def new
  end

  def edit
  end
end
