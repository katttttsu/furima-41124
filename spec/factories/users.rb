FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 5) }
    password_confirmation { password }
    first_name { 'タロウ' }
    last_name { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'ヤマダ' }
    birthday { '2000-01-01' }
    
  end
end