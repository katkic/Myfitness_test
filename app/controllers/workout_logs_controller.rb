class WorkoutLogsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @workout_logs = @user.workouts.order(created_at: :desc)
  end
end
