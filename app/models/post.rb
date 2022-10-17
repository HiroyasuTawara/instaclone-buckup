class Post < ApplicationRecord
  belongs_to :user
  mount_uploaders :image, ImageUploader

  validates :image, presence: true
end
