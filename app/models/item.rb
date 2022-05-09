class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to        :user
  has_one           :purchase_log
  has_many_attached :images
  belongs_to        :category
  belongs_to        :condition
  belongs_to        :shipping_day
  belongs_to        :shipping_fee
  belongs_to        :shipping_from

  validates :name,              presence:     true
  validates :description,       presence:     true
  validates :category_id,       numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_from_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :price,             numericality: { only_integer: true }
  validates :images,            length:       { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
end
