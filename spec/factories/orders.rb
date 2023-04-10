FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { 'あああ市' }
    house_number { '1-1-1' }
    building_name { 'あああアパート' }
    phone_number { '09011112222' }
    
    token { 'tok_abcdefghijk00000000000000000' }
    
  end
end
