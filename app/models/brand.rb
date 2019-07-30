class Brand < ApplicationRecord
  has_many :categories, through: :brand_categories
  has_many :brand_categories
  has_many :items
end 