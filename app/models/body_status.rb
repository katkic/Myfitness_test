class BodyStatus < ApplicationRecord
  belongs_to :user

  validates :body_weight, presence: true, numericality: { greater_than: 0.0, allow_blank: true }
  validates :body_fat, numericality: { greater_than: 0.0, allow_blank: true }

  mount_uploader :picture1, BodyStatusImageUploader
  mount_uploader :picture2, BodyStatusImageUploader
  mount_uploader :picture3, BodyStatusImageUploader

  paginates_per 14

  def self.get_bmi(height, weight)
    return if height.blank?

    (weight / (height / 100) ** 2).floor
  end

  scope :get_body_weight_records, -> (current_user, range) do
    where(user_id: current_user.id).where(created_at: range).pluck(:created_at, :body_weight)
  end

  scope :get_body_fat_records, -> (current_user, range) do
    where(user_id: current_user.id).where(created_at: range).pluck(:created_at, :body_fat)
  end
end
