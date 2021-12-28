# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NAMES = ["night", "birthday", "boy", "girl", "celebration", "gold", "flower", "precious", "marvelous", "wonder"]
DESCRIPTIONS = [ "incredible", "brilliant", "amazing", "enjoy", "the best ever"]
SIZES = [2, 4, 6, 8, 10]
PRICES = []

puts "Start seed ..."

10.times do

  name = NAMES[rand(10)]
  description = DESCRIPTIONS[rand(5)]
  size = SIZES[rand(5)]
  price = rand(100)

  cake = Cake.new(name: name, description: description, size: size, price: price)
  cake.save
end

puts "End of seed ..."
puts "Creation de #{Cake.count} gateaux"
