class Category < ApplicationRecord
  belongs_to :group
  belongs_to :welfare
end