FactoryBot.define do
  factory :item do
    name              { '商品名' }
    description       { '商品の説明' }
    category_id       { 2 }
    condition_id      { 2 }
    shipping_cost_id  { 2 }
    prefecture_id     { 2 }
    shipping_day_id   { 2 }
    price             { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
