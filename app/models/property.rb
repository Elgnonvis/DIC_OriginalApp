class Property < ApplicationRecord
  mount_uploaders :images, ImageUploader
  paginates_per 5
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many_attached :images
  #accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
  validates :name, presence:true, length: {minimum:1, maximum:30}
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :type_of_property, presence: true
  validates :status, presence: true
  validate :image_type

  # def thumbnail input
  #   return self.images[input].variant(resize: '500*500!').processed
  # end

  scope :type_of_property_search, -> (query) {where("type_of_property LIKE ?", "%#{query}%")}
    def type_of_property_search(query)
      where("type_of_property LIKE ?", "%#{query}%")
    end

	scope :status_search, -> (query) {where(status: query)}
    def status_search(query)
      where(status: query)
    end

  private
  def image_type
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png '))
        errors.add(:images, 'needs to be JPEG or PNG')
      end
    end
  end
end
