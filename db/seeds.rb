# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = RestClient.get('https://api.scryfall.com/cards/search?order=set&q=e%3Ahou&unique=prints')
data = JSON.parse(response)
cards_hash = data['data']
cards_hash.each do |card|
    Card.create(
        name: card['name'],
        set_name: card['set_name'],
        collector_number: card['collector_number'],
        pic_url: card['image_uris']['normal'],
        price: card['usd']
    )
end

store = Store.create(name: 'magic card store')

# customer1 = Customer.create(name: 'minh')
# customer2 = Customer.create(name: 'kevin')

# shoppingcart1 = ShoppingCart.create(customer_id: 1)
# shoppingcart2 = ShoppingCart.create(customer_id: 2)

# shoppingcart1.puts_in_cart(Card.first.id)

# purchase1 = Purchase.create(card_id: 4, customer_id: 1)
# purchase1 = Purchase.create(card_id: 5, customer_id: 2)


