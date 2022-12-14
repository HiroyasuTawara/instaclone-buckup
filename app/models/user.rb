class User < ApplicationRecord
  mount_uploader :icon, IconUploader
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  
  before_validation { email.downcase! }

  has_secure_password
  validates :password, length: { minimum: 6 }
end
