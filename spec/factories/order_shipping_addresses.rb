FactoryBot.define do
  factory :order_shipping_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '東京都' }
    address{ '1-1' }
    building_name { '' }
    telephone_number { 2000 }
    
  end
end
