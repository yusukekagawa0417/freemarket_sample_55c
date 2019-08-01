class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture, shortcuts: :name
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many   :images, dependent: :destroy
  has_many   :likes, dependent: :destroy

  accepts_nested_attributes_for :images

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :condition, presence: true
  validates :shipping_fee, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :status,  presence: true

  enum condition: {
    "新品、未使用": 0,
    "未使用に近い": 1,
    "目立った傷や汚れなし": 2,
    "やや傷や汚れあり": 3,
    "傷や汚れあり": 4,
    "全体的に状態が悪い": 5
  }
  
  enum shipping_fee: {
    "送料込み(出品者負担)": 0,
    "着払い(購入者負担)": 1
  }

  enum shipping_date: {
    "1~2日で発送": 0,
    "2~3日で発送": 1,
    "4~7日で発送": 2
  }

  enum status: {
    "出品中": 0,
    "取引中": 1,
    "出品停止中": 2,
    "売却済み": 3
  }

  # 前後のアイテムレコードの取得
  def prev
    Item.where("id<?", self.id).order("id DESC").first
  end
  
  def next
    Item.where("id>?", self.id).order("id ASC").first
  end  
end
