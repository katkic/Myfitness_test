class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show edit update destroy]
  before_action :set_exercise, only: %i[show edit update]

  def index
    @exercise = Exercise.find(params[:id])
    @workouts = @exercise.workouts.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @exercise_logs = @workout.exercise_logs
  end

  def new
    @exercise = Exercise.find(params[:exercise_id])
    @workout = Workout.new
    3.times { @workout.exercise_logs.build }
  end

  def create
    @workout = current_user.workouts.build(workout_params)

    if @workout.save
      redirect_to workout_path(@workout), notice: "トレーニング「#{self.class.helpers.format_date_time(@workout.created_at)}」を記録しました"
    else
      render :new
    end
  end

  def edit;end


  def update
    if @workout.update(workout_params)
      redirect_to workout_path(@workout), notice: "トレーニング「#{self.class.helpers.format_date_time(@workout.created_at)}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path(id: @workout.exercise.id), notice: "「トレーニング #{self.class.helpers.format_date_time(@workout.created_at)}」を削除しました"
  end

  private

  def workout_params
    params.require(:workout).permit(
      :exercise_id,
      :created_at,
      :condition,
      :memo,
      exercise_logs_attributes: %i[set weight rep]
    )
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def set_exercise
    @exercise = @workout.exercise
  end
end
