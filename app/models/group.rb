class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  scope :not_grouped, -> { left_outer_joins(:categories).where('categories.group_id' => nil) }

  belongs_to :user
  has_many :categories
  has_many :welfares, through: :categories
end