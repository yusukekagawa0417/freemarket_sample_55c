class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :items, dependent: :destroy
  has_many :receipts, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :messages, dependent: :destroy
  # has_many :evaluations, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: {in: 6..128}
  validates :nickname, presence: true, length: {maximum: 20}
  validates :firstname, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :lastname, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :firstname_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :lastname_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birthday, presence: true
  validates :tel, uniqueness: true, format: {with: /\A\d{10}\z|\A\d{11}\z/ } 
  validates :customer, presence: true
  validates :card, presence: true 

end