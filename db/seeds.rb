# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

buyer = User.create(email: "buyer@test.com", password: "password")
seller = User.create(email: "seller@test.com", password: "password")
zebra = Product.create(name: "Normal Zebra", price: 4000.00, description: "A normal zebra")
fast_zebra = Product.create(name: "Fast Zebra", price: 5000.00, description: "A fast zebra")
dumb_zebra = Product.create(name: "Dumb Zebra", price: 3000.00, description: "A dumb zebra")
