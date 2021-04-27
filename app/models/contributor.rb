class Contributor < ApplicationRecord
  validates :name, presence: true, length: { in: 3..100 }
  validates :phonenumber, presence: true, uniqueness: true, length: { is: 10 }
  validates :contributor_no, presence: true, uniqueness: true, length: { in: 4..10 }
  validates :icon, presence: true

  has_many :welfares, foreign_key: :contributor_no
end

