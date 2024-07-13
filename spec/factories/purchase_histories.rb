FactoryBot.define do
  factory :purchase_history do
    association :item_
    association :user
    association :address
  end
end
