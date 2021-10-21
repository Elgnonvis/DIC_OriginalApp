FactoryBot.define do
  factory :comment do
    property { @property.id }
    user_id { user.id }
    content { "MyText" }
  end
end
