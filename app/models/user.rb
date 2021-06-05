class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_one_attached :avatar

  COMMUNITIES = %w(Rocinha Vidigal Borel Formiga Macacos Barbante Rola)
  INTERESTS = %w(Sports Politics Social Security Economy)

  #validates :communities, inclusion: { in: COMMUNITIES }  
  #validates :interests, inclusion: { in: INTERESTS }  
  validates :email, presence: true
  validates :email, format: { with: /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/, message: "Invalid email" }
  #validates :password, presence: true
end
