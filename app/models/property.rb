class Property < ApplicationRecord
  mount_uploader :illustration, ImageUploader
  paginates_per 5
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :name, presence:true, length: {minimum:1, maximum:30}
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :type_of_property, presence: true
  validates :status, presence: true



  scope :type_of_property_search, -> (query) {where("type_of_property LIKE ?", "%#{query}%")}
    def type_of_property_search(query)
      where("type_of_property LIKE ?", "%#{query}%")
    end

	scope :status_search, -> (query) {where(status: query)}
    def status_search(query)
      where(status: query)
    end

  # has_many :images, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
  
end