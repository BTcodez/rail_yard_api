FactoryBot.define do
    factory :order do
        car_id { "ULX19230590" }
        requested_date {  "2024-04-24" }
        received_date { "2024-04-29" }
        extraction_start { "2024-05-01" }
        extraction_end { "2024-05-02" }
        release_date { "2024-05-06" }
        user_id { "1" }
        raw_material_id { "12" }
        weight { 180000 }
    end
end