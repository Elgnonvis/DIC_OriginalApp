class Appointment < ApplicationRecord
  paginates_per 5
  belongs_to :user, optional: true
  validates :description, presence:true, length: {minimum:1, maximum:50}
  validates :date, presence:true
end
