class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password_digest
      t.integer :store_id, :default => 1

      t.timestamps
    end
  end
end

