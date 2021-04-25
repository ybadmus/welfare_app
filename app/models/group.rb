class Group < ApplicationRecord
  validates :name, presence: { message: 'is missing. please add a name' }, uniqueness: true
  validates :icon, presence: { message: 'is missing. please add an icon' }

  belongs_to :user
  has_many :categories
  has_many :welfares, through: :categories
end
