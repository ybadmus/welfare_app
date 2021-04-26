class Welfare < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  validates :remark, length: { maximum: 250 }
  validates :group, presence: false
  validates :contributor_no, presence: true

  scope :not_grouped, -> { left_outer_joins(:categories).where('categories.group_id' => nil) }
  scope :total_amount, -> { sum(:amount) }

  belongs_to :user, class_name: 'User', foreign_key: :authorId
  belongs_to :contributor, class_name: 'Contributor', foreign_key: :contributor_no
  has_many :categories
  has_many :groups, through: :categories
end