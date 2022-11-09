# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# test not to sell potatoes before having bought them
patatePrices = [100,120,90,120,95,150,80,100]
for index in 0..patatePrices.length()-1 do
	PatateItem.create(time: "2022-08-23T09:00:0#{index}.000Z", value: patatePrices[index])
end

# test for an unordered list
patatePrices = [100,120,120,95,150,80,100]
for index in 0..patatePrices.length()-1 do
	PatateItem.create(time: "2022-08-24T09:00:0#{index}.000Z", value: patatePrices[index])
end

PatateItem.create(time: "2022-08-24T08:59:00.000Z", value: 90)
