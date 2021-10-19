FactoryBot.define do
  factory :comment do
    property { nil }
    user { nil }
    content { "MyText" }
  end
end
