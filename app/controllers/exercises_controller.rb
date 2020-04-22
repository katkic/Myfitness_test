class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[show edit update destroy]

  def index
    @exercises_preset = Exercise.preset
    @exercises_original = Exercise.original
  end

  def show;end

  def new
    @exercise = current_user.exercises.build
  end

  def edit;end

  def create
    @exercise = current_user.exercises.build(exercise_params)

    if @exercise.save
      redirect_to exercise_path(@exercise), notice: 'トレーニング種目を登録しました'
    else
      render :new
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercise_path(@exercise), notice: 'トレーニング種目を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path, notice: 'トレーニング種目を削除しました'
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :part, :category, :description, :icon)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end
