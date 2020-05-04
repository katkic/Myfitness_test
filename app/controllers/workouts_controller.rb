class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show edit update destroy]

  def index
    @exercise = Exercise.find(params[:id])
    @workouts = @exercise.workouts.where(user_id: current_user.id).order(created_at: :desc).page(params[:page])
  end

  def show
    @exercise_logs = @workout.exercise_logs.order(set: :asc)
  end

  def new
    @exercise = Exercise.find(params[:exercise_id])
    @workout = Workout.new
    3.times { @workout.exercise_logs.build }
  end

  def create
    @exercise = Exercise.find(params[:workout][:exercise_id])
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
      exercise_logs_attributes: %i[id set weight rep _destroy]
    )
  end

  def set_workout
    @workout = Workout.find(params[:id])
    @exercise = @workout.exercise
  end
end
