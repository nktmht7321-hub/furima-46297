class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  # 空の投稿を保存できないようにする
  validates :image,       presence: true
  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  # 価格の範囲と、半角数字のみ許可する
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
