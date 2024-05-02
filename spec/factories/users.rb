FactoryBot.define do
  factory :user do
    name { Faker::Name }
    email { Faker::Internet.email }
    password_hash { Faker::Internet.password }
    user_type { "General User" }
  end
end
