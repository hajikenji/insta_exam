class User < ApplicationRecord
  mount_uploader :my_image, MyUploader
  before_validation { email.downcase! } if validates :email, presence: true
  has_secure_password
  validates :user_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  validates :password, length: { minimum: 6 }
  #   validates :my_image, presence: true
  has_many :pictures, dependent: :destroy
end
