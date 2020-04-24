# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# for i in 1..3
#   User.create(
#     email: "#{Faker::Name.name}@gmail.com",
#     password: "#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}"
#   )
# end

# 6.times do |x|
#   toy = Toy.create(
#       name: "Toy#{x}",
#       description: "Toy#{x} is super safe",
#       date_posted: Time.now,
#       posted_by: ["Sally", "Sam", "Tyson", "Mark"].sample,
#       user_id: rand(1..3)
#   )
#   puts toy.name
# end
3.times do
  manufacturer = Manufacturer.create(
    name: Faker::TvShows::Seinfeld.business,
    location:Faker::Nation.capital_city
  )
  puts "created manufacturers"
end

def random_manufacturer_index
  rand(1..3)
end

3.times do
  user = User.create(
      email: Faker::Internet.email,
      password: "#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}"
  )
  puts "created new users"
  2.times do
    toy = Toy.create(
      name: "Toy#{Toy.count + 1}",
      description: "Toy#{Toy.count + 1} is super safe",
      date_posted: Time.now,
      posted_by: ["Sally", "Sam", "Tyson", "Mark"].sample,
      user_id: user.id,
      manufacturer_id: random_manufacturer_index
    )
    toy.save
    puts "created new toys"
  end
end





