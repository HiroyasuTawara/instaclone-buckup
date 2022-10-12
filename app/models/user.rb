class User < ApplicationRecord
  mount_uploder :icon, ImageUploader
end
