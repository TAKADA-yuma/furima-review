FactoryBot.define do
  factory :order_address do
    postal_code   { '111-1111' }
    prefecture_id { 1 }
    city          { 'テスト市' }
    address       { '1-1-1' }
    building      { 'テストビル' }
    phone_number  { '09012345678' }
    token         { 'hoge_12345678' }
  end
end
