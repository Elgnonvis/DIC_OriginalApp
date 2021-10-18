class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
 include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog
  version :profile_size do
    process resize_to_fill: [500, 500]
   end
  
  version :tiny do
    process resize_to_fill: [50, 50]
   end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [200, 300]
  
  def extension_allowlist
     %w(jpg jpeg png)
  end

end