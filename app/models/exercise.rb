class Exercise < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :part, inclusion: { in: %w[chest leg back shoulder arm abdominals other] }
  validates :category, inclusion: { in: %w[free_weight machine] }

  has_many :menu_relationships, dependent: :destroy
  has_many :menus, through: :menu_relationships, source: :menu
  has_many :workouts
  belongs_to :user

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

  scope :preset, -> { where(preset: true) }
  scope :original, -> { where(preset: false) }

  scope :exercise_search, -> (search_params) do
    if search_params[:name].present?
      name_like(search_params[:name])
    elsif search_params[:part].present?
      preset_is.part_is(search_params[:part])
    elsif search_params[:category].present?
      preset_is.category_is(search_params[:category])
    end
  end

  scope :preset_is, -> { where(preset: true) }
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :part_is, -> (part) { where(part: part) if part.present? }
  scope :category_is, -> (category) { where(category: category) if category.present? }
end
