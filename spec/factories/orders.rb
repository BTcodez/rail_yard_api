FactoryBot.define do
  factory :order do
    car_id { Faker::Vehicle.vin }
    requested_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) }
    received_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) }
    extraction_start { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) }
    extraction_end { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) }
    release_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) }
    user { nil }
    raw_material { nil }
  end
end
