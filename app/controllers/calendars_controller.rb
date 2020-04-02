class CalendarsController < ApplicationController
  def show
    @workouts = current_user.workouts
  end
end
