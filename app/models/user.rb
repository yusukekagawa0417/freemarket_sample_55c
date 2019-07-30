class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :items, dependent: :destroy
  # has_many :receipts, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :messages, dependent: :destroy
  # has_many :evaluations, dependent: :destroy

end
