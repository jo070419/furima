class PurchaseLogDeliveryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture, :municipality, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,    format:       {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture,   numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :house_number
    validates :phone_number
  end

  def save
    purchase_log = PurchaseLog.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(post_code: post_code, prefecture: prefecture, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, purchase_log_id: purchase_log.id)
  end
  
end