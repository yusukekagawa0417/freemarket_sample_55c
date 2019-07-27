class Item < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many   :images, dependent: :destroy

  accepts_nested_attributes_for :images

  validates :name, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_date, presence: true
  validates :price, presence: true
end
