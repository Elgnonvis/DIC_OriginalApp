FactoryBot.define do
  factory :appointment do
    description { "MyText" }
    status { "MyString" }
    date { "2021-10-20 16:59:57" }
    user { nil }
  end
end
