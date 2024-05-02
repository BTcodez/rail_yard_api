FactoryBot.define do
  factory :raw_material do
    material_name { Faker::Science.element }
    weight { Faker::Number.number(digits: 6) }
  end
end
