class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  has_many :user
end