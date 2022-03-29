class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :name,          null: false
      t.text       :description,   null: false
      t.string     :category,      null: false
      t.string     :condition,     null: false
      t.string     :shipping_fee,  null: false
      t.string     :shipping_from, null: false
      t.string     :shipping_day,  null: false
      t.integer    :price,         null: false
      t.references :user,          null: false, foreign_key: true
    end
  end
end
