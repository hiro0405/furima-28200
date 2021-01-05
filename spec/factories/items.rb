FactoryBot.define do
  factory :item do
    name {Faker::Commerce.name}
    description {Faker::Lorem.sentence}
    category_id {"5"}
    status_id {"2"}
    shipping_charge_id {"3"}
    shipping_area_id {"3"}
    estimated_shipping_date_id {"3"}
    price {"5000"}
    user_id {"1"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
