FactoryBot.define do
  factory :property do
    name { "MyString" }
    type_of_property { "MyString" }
    description { "MyText" }
    illustration { "MyString" }
    address { "MyString" }
    price { 1 }
    status { "MyString" }
    user { nil }
  end
end
