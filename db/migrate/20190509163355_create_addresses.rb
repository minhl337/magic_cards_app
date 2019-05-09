class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city 
      t.string :state
      t.integer :postal_code
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
