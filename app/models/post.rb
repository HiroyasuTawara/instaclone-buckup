class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploaders :image, ImageUploader
  LIMIT_NUMBER_OF_FILES = 4
  validates :image, presence: true
  

  def validate_number_of_files
    return if post.image.length <= LIMIT_NUMBER_OF_FILES
    errors.add(:image,"に添付できる画像は#{LIMIT_NUMBER_OF_FILES}件までです。")
  end

end
