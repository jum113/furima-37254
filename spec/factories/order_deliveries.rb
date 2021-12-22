FactoryBot.define do
  factory :order_delivery do
    post_code { '123-4567' }
    delivery_area_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Address.city }
    address { Faker::Address.street_address }
    building { 'ハイツ' }
    telephone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
