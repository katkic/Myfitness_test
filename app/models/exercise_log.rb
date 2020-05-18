class ExerciseLog < ApplicationRecord
  belongs_to :workout

  validates :weight, presence: true, numericality: { greater_than: 0.0, allow_blank: true }
  validates :rep, presence: true, numericality: { only_integer: true, greater_than: 0, allow_blank: true }

  def self.get_one_rm(exercise_log)
    once_or_more(exercise_log)
  end

  def self.once_or_more(exercise_log)
    if exercise_log[:rep] == 1
      exercise_log[:weight]
    else
      choose_bench_or_squat(exercise_log)
    end
  end

  def self.choose_bench_or_squat(exercise_log)
    # 1RM = 使用重量 × {1 + (持ち上げた回数 ÷ 40)}
    # スクワット・デッドリフトのRM換算表を作りたい場合は補正係数を33.3にする
    exercise_name = exercise_log.workout.exercise.name

    case exercise_name
    when 'スクワット', 'デッドリフト'
      (exercise_log[:weight] * (1 + (exercise_log[:rep] / 33.3))).floor(1)
    else
      (exercise_log[:weight] * (1 + (exercise_log[:rep] / 40.0))).floor(1)
    end
  end

  private_class_method :once_or_more, :choose_bench_or_squat
end
