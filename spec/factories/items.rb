FactoryBot.define do
  factory :item do
    product_name           {Faker::Lorem.sentence}
    product_description    {Faker::Lorem.sentence}
    product_price          {Faker::Number.between(from: 300, to: 9_999_999) }
    category_id            { 2 }
    condition_id           { 2 }
    delivery_pay_id        { 2 }
    city_id                { 2 }
    delivery_span_id       { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/logo.png'), filename: 'logo.png')
    end
  end
end
