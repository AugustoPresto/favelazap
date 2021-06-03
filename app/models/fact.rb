class Fact < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, :communities, :interests, presence: true
  validates :title, length: { maximum: 70, too_long: "%{count} characters is the maximum allowed" }
end
