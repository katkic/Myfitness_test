class Menu < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  belongs_to :user
  has_many :menu_relationships, dependent: :destroy
  has_many :exercises, through: :menu_relationships, source: :exercise

  scope :preset, -> { where(preset: true) }
  scope :original, -> { where(preset: false) }
end
