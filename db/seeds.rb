puts "🌱 Seeding spices..."

Seed your database here
food = Category.create(name: "Food")
tech = Category.create(name: "Tech")
misc = Category.create(name: "Misc")


Todos.create(task: "Buy Milk", category_id: food.id)
Todos.create(task: "Buy Cheese", category_id: food.id)

Todos.create(task: "Upgrade Internet", category_id: tech.id)
Todos.create(task: "Buy RAM", category_id: tech.id)

Todos.create(task: "Do Laundry", category_id: misc.id)
Todos.create(task: "Walk the Dog", category_id: misc.id)

puts "✅ Done seeding!"
