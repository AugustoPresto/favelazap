class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo

  validates :title, :subtitle, :content, :communities, :interests, presence: true
  validates :title, length: { maximum: 80, too_long: "%{count} characters is the maximum allowed" }
  validates :subtitle, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
end
