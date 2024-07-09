FactoryBot.define do
  factory :item do
    item_name { "Example item" }
    explanation { "This is an example item." }
    price { Faker::Number.between(from: 300, to: 9999999) }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    association :user

  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
