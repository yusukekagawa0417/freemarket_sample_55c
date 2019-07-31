class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :items, dependent: :destroy
  has_many :receipts, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :messages, dependent: :destroy
  # has_many :evaluations, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}
  validates :nickname, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :firstname_kana, presence: true
  validates :lastname_kana, presence: true
  validates :birthday, presence: true
  validates :tel, uniqueness: true 
  validates :customer, presence: true, uniqueness: true 

end