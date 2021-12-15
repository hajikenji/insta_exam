class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :comment, presence: true, length: { maximum: 150 }
  belongs_to :user
end
