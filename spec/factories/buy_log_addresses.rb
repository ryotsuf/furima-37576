FactoryBot.define do
  factory :buy_log_address do
    postcode { '111-1111' }
    region_delivery_id { 3 }
    city  { '東京都' }
    street_address { '青山1-1-1' }
    building_name { 'らんらん' }
    phone_number { '12345678901' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
