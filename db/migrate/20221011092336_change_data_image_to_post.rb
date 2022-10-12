class ChangeDataImageToPost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :image, :json, using: 'image::json'
  end
end
