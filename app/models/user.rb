class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :facts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments
  has_one_attached :avatar

  COMMUNITIES = %w(Rocinha Vidigal Borel Formiga Macacos Alemão Antares Jacaré Chapadão Terreirão)
  INTERESTS = %w(Sports Culture Health Social Security Economy Politics Others)

  validates :communities, inclusion: { in: COMMUNITIES }  
  validates :interests, inclusion: { in: INTERESTS }  

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/, message: "Invalid email" }

  def fullname
    "#{first_name} #{last_name}"
  end
end
