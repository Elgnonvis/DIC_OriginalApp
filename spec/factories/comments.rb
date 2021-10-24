FactoryBot.define do
  factory :comment do
    property { @property.id }
    user_id { user.id }
    content { "Mon premier commentaire" }
  end

  factory :second_comment, class: Comment do
    property { @property.id }
    user_id { user.id }
    content { "Mon commentaire!" }
  end
end
