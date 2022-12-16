FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'フリマ' }
    first_name            { '太郎' }
    last_name_kana        { 'フリマ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '1999-01-01' }
  end
end
