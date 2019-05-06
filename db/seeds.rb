# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
store = Store.create(name: 'magic card store')

customer1 = Customer.create(name: 'minh')
customer2 = Customer.create(name: 'kevin')

shoppingcart1 = ShoppingCart.create(customer_id: 1)
shoppingcart2 = ShoppingCart.create(customer_id: 2)


card1 = Card.create(name: 'aaa')
card2 = Card.create(name: 'bbb')
card3 = Card.create(name: 'ccc')
card4 = Card.create(name: 'ddd')
card5 = Card.create(name: 'zzz')

shoppingcart1.puts_in_cart(card1.id)

purchase1 = Purchase.create(card_id: 4, customer_id: 1)
purchase1 = Purchase.create(card_id: 5, customer_id: 2)


