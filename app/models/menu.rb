class Menu < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :exercise_ids, presence: true

  belongs_to :user
  has_many :menu_relationships, dependent: :destroy
  has_many :exercises, through: :menu_relationships, source: :exercise

  enum interval: {
    one:   1,
    two:   2,
    three: 3,
    four:  4,
    five:  5
  }
end
