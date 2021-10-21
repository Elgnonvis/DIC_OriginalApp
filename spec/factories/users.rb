FactoryBot.define do
  factory :user do
    login { 'username@example.com' }
    password { 'password' }
  end
end
