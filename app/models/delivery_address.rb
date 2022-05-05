class DeliveryAddress < ApplicationRecord
  belongs_to :purchase_log
end
