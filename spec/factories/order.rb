FactoryBot.define do
    factory :user do
        name { Faker::Name.first_name }
        email { Faker::Internet.email }
        password_digest { Faker::Internet.password(min_length: 10, max_length: 20) }
        user_type { 'General User' }
    end
end