class Image < ApplicationRecord
  mount_uploader :illustration, ImageUploader
  belongs_to :property
end
