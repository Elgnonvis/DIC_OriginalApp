class Appointment < ApplicationRecord
  paginates_per 5
  belongs_to :user
  validates :description, presence:true, length: {minimum:1, maximum:50}
end