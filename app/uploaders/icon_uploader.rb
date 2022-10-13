class IconUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    picture-user_default_icon.png
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
  
  
  process resize_to_fill: [400, 400, "center"]

end
