FactoryBot.define do
  factory :purchase_history_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone { '09012345678' }

    association :user
    association :item
  end
end
