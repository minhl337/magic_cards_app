class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :set_name
      t.string :collector_number
      t.string :pic_url
      t.string :price
      t.integer :quantity, :default => 100

      t.timestamps
    end
  end
end
