FactoryBot.define do
  factory :order do
    car_id { "MyString" }
    requested_date { "2024-05-02 14:46:44" }
    received_date { "2024-05-02 14:46:44" }
    extraction_start { "2024-05-02 14:46:44" }
    extraction_end { "2024-05-02 14:46:44" }
    release_date { "2024-05-02 14:46:44" }
    user { nil }
    raw_material { nil }
  end
end
