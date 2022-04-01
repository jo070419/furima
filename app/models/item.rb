class Item < ApplicationRecord
  

  belongs_to :user
  has_one    :purchase_log
  has_one_attached :image
end
