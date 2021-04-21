class Welfare < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  scope :not_grouped, -> { left_outer_joins(:categories).where('categories.group_id' => nil) }
  scope :total_amount, -> { sum(:amount) }

  belongs_to :user, class_name: :user, foreign_key: :authorId
  has_many :categories
  has_many :groups, through :categories
end 