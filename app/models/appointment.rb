class Appointment < ApplicationRecord
  paginates_per 5
  belongs_to :user, optional: true
  validates :description, presence:true, length: {minimum:1, maximum:50}
  # validates :date, presence:true

  validates :date,
  :date => { :after => Time.now + 1.hour, :before => Time.now + 1.year }
end
# <div data-l="fr" class="wgcurrent wg-li fr"><a tabindex="-1" href="#" target="_self" role="none" id="weglot-language-fr">Français</a></div>