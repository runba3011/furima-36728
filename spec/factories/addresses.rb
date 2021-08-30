FactoryBot.define do
  factory :address do
    post_number {'444-4444'}
    prefecture_id {25}
    city {"名古屋市"}
    building_number {'1-32-1'}
    phone_number {"08019191919"}
    association :history
  end
end
