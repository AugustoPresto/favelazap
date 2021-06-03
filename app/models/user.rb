class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :facts
  has_one_attached :avatar

  validates :email, presence: true
  validates :email, format: { with: /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/, message: "Invalid email" }
  validates :password, presence: true
end
