class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :name, presence: true
  validates :last_name_furigana, presence: true
  validates :name_furigana, presence: true
  validates :birthday, presence: true

end