class CalendarsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @workouts = @user.workouts
  end
end
