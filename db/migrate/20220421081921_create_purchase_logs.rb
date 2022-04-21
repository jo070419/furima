class CreatePurchaseLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_logs do |t|

      t.timestamps
    end
  end
end
