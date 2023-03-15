class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entities
  has_many :groups

  validates :name, length: { maximum: 80 }, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
