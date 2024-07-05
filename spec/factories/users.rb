FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 7) }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    first_name_kana { 'タロウ' }
    last_name_kana { 'ヤマダ' }
    birthday { '2000-01-01' }
  end
end