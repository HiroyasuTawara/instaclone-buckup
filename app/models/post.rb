class Post < ApplicationRecord
  belongs_to :user
  mount_uploder :image, ImageUploader
end
