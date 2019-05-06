class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :card_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
