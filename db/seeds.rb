# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Brew.destroy_all
Customer.destroy_all
# Purchase.destroy_all
5.times do
  brew = Brew.new(
    blend_name: Faker::Coffee.blend_name,
    origin: Faker::Coffee.origin,
    notes: Faker::Coffee.notes,
    strength: rand(1..5)
  )
  if brew.valid?
    brew.save
  else
    byebug
  end
end

5.times do
  customer = Customer.new(name: Faker::Name.name)
  if customer.valid?
    customer.save
  else
    byebug
  end
end
purchase = Purchase.new(customer_id: Customer.all.sample.id , brew_id: Brew.all.sample.id, size: "small", strength: "Strong")
if purchase.valid?
  purchase.save
else
  byebug
  true
end
