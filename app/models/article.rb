class Article < ApplicationRecord
  belongs_to :user

  validates :title, :subtitle, :content, :communities, :interests, presence: true
  validates :title, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
  validates :subtitle, length: { maximum: 70too_long: "%{count} characters is the maximum allowed" }
end
