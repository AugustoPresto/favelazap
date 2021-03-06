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
  validates :communities, presence: true
  validates :interests, presence: true
  validates :email, format: { with: /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/, message: "Invalid email" }

  def fullname
    "#{first_name} #{last_name}"
  end

  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:current_password)
      self.update_without_password(params)
    else
      self.verify_password_and_update(params)
    end
  end

  def update_without_password(params={})
    params.delete(:password)
    params.delete(:password_confirmation)
    result = update(params)
    clean_up_passwords
    result
  end

  def verify_password_and_update(params)
    #devises' update_with_password
    # https://github.com/plataformatec/devise/blob/master/lib/devise/models/database_authenticatable.rb
    current_password = params.delete(:current_password)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    result = if valid_password?(current_password)
      update_attributes(params)
    else
      self.attributes = params
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end
    clean_up_passwords
    result
  end

end
