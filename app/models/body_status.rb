class BodyStatus < ApplicationRecord
  belongs_to :user

  validates :body_weight, presence: true, numericality: { greater_than: 0.0, allow_blank: true }
  validates :body_fat, numericality: { greater_than: 0.0, allow_blank: true }

  mount_uploader :picture1, BodyStatusImageUploader
  mount_uploader :picture2, BodyStatusImageUploader
  mount_uploader :picture3, BodyStatusImageUploader

  def self.get_bmi(height, weight)
    return if height.blank?

    (weight / (height / 100) ** 2).floor
  end

  def self.get_exercise_part_count(workouts)
    exercise_part = Hash.new { 0 }
    workouts.each do |workout|
      part = workout.exercise.part
      case part
      when part
        exercise_part["#{part}"] += 1
      end
    end

    exercise_part
  end

  scope :get_body_weight_records, -> (current_user, range) do
    where(user_id: current_user.id).where(created_at: range).pluck(:created_at, :body_weight)
  end

  scope :get_body_fat_records, -> (current_user, range) do
    where(user_id: current_user.id).where(created_at: range).pluck(:created_at, :body_fat)
  end
end
