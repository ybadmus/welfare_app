class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { in: 3..12 }
  validates :username, format: { with: /[a-zA-Z0-9]/ }

  has_many :welfares, foreign_key: :authorId
  has_many :groups
end