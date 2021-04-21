class Welfare < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :user, class_name: :user, foreign_key: :authorId
  has_many :categories
  has_many :groups, through :categories
end