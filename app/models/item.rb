class Item < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many   :images, dependent: :destroy

  accepts_nested_attributes_for :images
end
