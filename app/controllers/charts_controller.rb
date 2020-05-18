class ChartsController < ApplicationController
  def index
    @range = Chart.get_range(params[:range])  # グラフの表示期間を取得
    @range_title = params[:range]
    @exercise_id = params[:id]
    @user = User.find(params[:user_id])
    # 種目のグラフを表示するためのリンク用
    @workouts = set_workouts_link

    select_body_statuses_or_workouts
  end

  private

  def set_workouts_link
    @user.workouts.select(:exercise_id).distinct
  end

  def find_exercise_name(exercise_id)
    Exercise.find(exercise_id).name
  end

  def select_body_statuses_or_workouts
    if @exercise_id == '0'
      @body_weight_records = BodyStatus.get_body_status_records(current_user, @range, :body_weight)
      @body_fat_records = BodyStatus.get_body_status_records(current_user, @range, :body_fat)
    else
      @exercise_name = find_exercise_name(@exercise_id)
      select_workout_chart
    end
  end

  def select_workout_chart
    @max_weight_records = Workout.get_workout_records(@user, @exercise_id, @range, :max_weight)
    @max_one_rm_records = Workout.get_workout_records(@user, @exercise_id, @range, :max_one_rm)
    @total_weight_records = Workout.get_workout_records(@user, @exercise_id, @range, :total_weight)
  end
end
