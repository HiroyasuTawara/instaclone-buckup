class Post < ApplicationRecord
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
  mount_uploaders :image, ImageUploader
  validates :image, presence: true

end
