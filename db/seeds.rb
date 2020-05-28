# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Cleaning database..."
Ingredient.destroy_all

puts "Creating ingredients..."
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list = open(url).read
ingredients = JSON.parse(list)

ingredients["drinks"].each do |ingredient|
  ingred = Ingredient.create(name: ingredient["strIngredient1"])
  puts "Creation of #{ingred.name}"
end
puts "Finished!"
puts "#{Ingredient.count} ingredients created"
