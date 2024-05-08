FactoryBot.define do
    factory :order do
        car_id { "ULX19230590" }
        requested_date {  Faker::Date.backward(days: 14) }
        received_date { Faker::Date.backward(days: 7) }
        extraction_start { Faker::Date.backward(days: 5) }
        extraction_end { Faker::Date.backward(days: 3) }
        release_date { Faker::Date.backward(days: 1) }
        user_id { "1" }
        raw_material_id { "12" }
    end
end