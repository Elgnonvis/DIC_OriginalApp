FactoryBot.define do
  factory :property do
    name { "Presidence" }
    type_of_property { "Villa" }
    description { "Villa propre" }
    illustration { nil }
    address { "Cotonou" }
    price { 25000 }
    status { "Vaccant" }
    user_id { user.id  }
  end
  factory :second_property, class: Property do
    name { "Erevan" }
    type_of_property { "House" }
    description { "Habitation de rêve" }
    illustration { nil }
    address { "Parakou" }
    price { 1 }
    status { "Occupied" }
    user_id { user.id  }
    
  end

end
