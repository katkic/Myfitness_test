class Exercise < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :part, inclusion: { in: [1, 2, 3, 4, 5, 6, 7] }
  validates :category, inclusion: { in: [1, 2] }

  has_many :menu_relationships, dependent: :destroy
  has_many :menus, through: :menu_relationships, source: :menu
  has_many :workouts
  belongs_to :user

  scope :preset, -> { where(preset: true) }
  scope :original, -> { where(preset: false) }

  enum part: {
    chest:       1,
    leg:         2,
    back:        3,
    shoulder:    4,
    arm:         5,
    abdominals:  6,
    other:       7
  }

  enum category: {
    free_weight: 1,
    machine:     2,
  }
end
