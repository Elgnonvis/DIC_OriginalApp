FactoryBot.define do
  factory :property do
    status { "Vaccant" }
    type_of_property { "Villa" }
    name { "Presidence" }
    description { "Villa propre" }
    address { "Cotonou" }
    price { 25000 }
    user_id { user.id  }
  end
  factory :second_property, class: Property do
    type_of_property { "House" }
    status { "Occupied" }
    name { "Erevan" }
    description { "Habitation de rêve" }
    address { "Parakou" }
    price { 1 }
    user_id { user.id  }
  end

end
