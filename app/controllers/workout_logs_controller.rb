class WorkoutLogsController < ApplicationController
  before_action :set_user

  def index
    @workout_logs = @user.workouts.order(created_at: :desc)
  end

  def search
    @search_params = workout_logs_search_params

    @workout_logs = if @search_params[:name].blank?
      @user.workouts.order(created_at: :desc)
    else
      @exercise = Exercise.find_by(name: @search_params[:name])
      @exercise.workouts
    end

    render :index
  end

  private

  def set_user
    if action_name == 'index'
      @user = User.find(params[:id])
    elsif action_name == 'search'
      @user = User.find(params[:search][:user_id])
    end
  end

  def workout_logs_search_params
    params.fetch(:search, {}).permit(:name)
  end
end
