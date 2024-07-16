class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,presence: true
  validates :first_name,presence: true
  validates :last_name,presence: true
  validates :first_name_kana,presence: true
  validates :last_name_kana,presence: true
  validates :birthday,presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "must contain both letters and numbers" }
  validates :last_name, :first_name, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]+\z/, message: "must be full-width Japanese characters" }
  validates :last_name_kana, :first_name_kana, format:  { with: /\A[\p{Katakana}ー]+\z/, message: "must be full-width katakana characters" }

  has_many :items
  has_many :purchase_histories, dependent: :destroy

  
end
