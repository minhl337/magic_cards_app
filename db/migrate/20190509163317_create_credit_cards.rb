class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :customer_id
      t.string :full_name
      t.string :card_number
      t.string :expiration_date
      t.string :security_code

      t.timestamps
    end
  end
end
