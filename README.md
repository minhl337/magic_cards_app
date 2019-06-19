Welcome to The Magic Mountain Online Trading Card Store application.
This is a full RESTful application running on a Ruby on Rails framework for both the frontend and backend.

It is seeding data from the awesome scryfall api. We only have the sets Hour of Devastation and Ultimate Masters as data for this build but you can add more by checking out Scyfall.
https://scryfall.com/

How to run the application.

1) Fork and Clone down.

2) Run these commands
```
bundle install
rails db:migrate
rails db:seed
rails s
```
3) Go to your local host at port 3000 to check out the application.

Video of running app: https://youtu.be/txNbcNS_8do
