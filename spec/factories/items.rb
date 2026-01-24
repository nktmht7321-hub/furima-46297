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
      # ▼▼ 修正箇所：Rails.root.join を使って「絶対パス」で指定します ▼▼
      item.image.attach(
        io: File.open(Rails.root.join('public/images/test_image.png')),
        filename: 'test_image.png'
      )
    end
  end
end
