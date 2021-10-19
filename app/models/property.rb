class Property < ApplicationRecord
  mount_uploader :illustration, ImageUploader
  paginates_per 5
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :name, presence:true, length: {minimum:1, maximum:30}
  validates :description, presence: true
  validates :illustration, presence: true
  validates :price, presence: true
  validates :address, presence: true



  # has_many :images, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
  
end
