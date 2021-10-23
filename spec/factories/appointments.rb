FactoryBot.define do
  factory :appointment do
    description { "Visitez la chambre" }
    status { "High" }
    date { "2021-10-25 16:59:57" }
    user_id { 1 }
  end

  factory :second_appointment, class: Appointment do
    description { "Aller sur le chantier de Parakou" }
    status { "Medium" }
    date { "2021-10-30 16:59:57" }
    user_id { 1 }
    
  end
end
