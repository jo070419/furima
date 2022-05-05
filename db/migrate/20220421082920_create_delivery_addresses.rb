class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string     :post_code,    null: false
      t.string     :prefecture,   null: false
      t.string     :municipality, null: false
      t.string     :house_number, null: false
      t.string     :building,     null: false
      t.string     :phone_number, null: false
      t.references :purchase_log, null: false, foreign_key: true
      t.timestamps
    end
  end
end