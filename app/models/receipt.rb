class Receipt < ApplicationRecord
  belongs_to :item
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

  validates :item_id, presence: true
  validates :seller_id, presence: true
  validates :buyer_id, presence: true
end
