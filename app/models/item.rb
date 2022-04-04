class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one    :purchase_log
  has_one_attached :image

  validates :name,              presence: true
  validates :description,       presence: true
  validates :category_id,       numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_from_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :price,             numericality: { only_integer: true }
end
