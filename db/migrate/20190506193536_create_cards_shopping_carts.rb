class CreateCardsShoppingCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :cards_shopping_carts do |t|
      t.integer :shopping_cart_id
      t.integer :card_id

      t.timestamps
    end
  end
end
