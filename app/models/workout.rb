class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  has_many :exercise_logs, dependent: :destroy

  accepts_nested_attributes_for :exercise_logs, allow_destroy: true,
    reject_if: proc { |attributes|
      attributes[:weight].blank? && attributes[:rep].blank?
    }

  enum condition: {
    very_good: 1,
    good:      2,
    nomal:     3,
    bad:       4,
    very_bad:  5
  }

  class << self
    def get_set(exercise_logs)
      return 0 if exercise_logs.empty?
      exercise_logs.last.set
    end

    def get_max_weight(exercise_logs)
      return 0 if exercise_logs.empty?

      weight_arr = exercise_logs.map { |exercise_log| exercise_log[:weight] }
      weight_arr.max
    end

    def get_one_rm_max(exercise_logs)
      return 0 if exercise_logs.empty?

      one_rm_max_arr = exercise_logs.map do |exercise_log|
        # 1RM = 使用重量 × {1 + (持ち上げた回数 ÷ 40)}
        # スクワット・デッドリフトのRM換算表を作りたい場合は補正係数を33.3にする
        case exercise_log[:name]
        when 'スクワット', 'デッドリフト'
          exercise_log[:weight] * (1 + (exercise_log[:rep] / 33.3))
        else
          exercise_log[:weight] * (1 + (exercise_log[:rep] / 40.0))
        end
      end

      one_rm_max_arr.max.floor(1)
    end

    def get_one_rm(exercise_log)
      return 0 unless exercise_log.present?

      exercise_log[:weight] * (1 + (exercise_log[:rep] / 40.0))
    end

    def get_total_weight(exercise_logs)
      return 0 if exercise_logs.empty?

      sum = 0
      exercise_logs.each { |exercise_log| sum += exercise_log[:weight] * exercise_log[:rep] }
      sum
    end
  end
end
