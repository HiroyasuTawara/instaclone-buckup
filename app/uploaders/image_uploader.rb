class ImageUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick

  
  storage :fog
  

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  process resize_to_fill: [1080,1080,'center']

end
