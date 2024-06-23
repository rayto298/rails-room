class WebApp < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 65_535 }
  validates :url, presence: true, length: { maximum: 255 }
  validates :github_url, length: { maximum: 255 }

  mount_uploader :image, ImageUploader
end
