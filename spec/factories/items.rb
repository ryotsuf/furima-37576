FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    explanation {'あああああああああああああああああああ'}
    category_id {2}
    condition_id {3}
    delivery_fee_id {2}
    region_delivery_id {10}
    days_to_deliver_id {2}
    price {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
