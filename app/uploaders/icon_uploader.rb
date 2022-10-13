class IconUploader < CarrierWave::Uploader::Base
  
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
  
  include CarrierWave::MiniMagick
  process resize_to_fill: [400, 400, "center"]

end
