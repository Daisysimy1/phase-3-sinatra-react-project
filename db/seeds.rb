puts "🌱 Seeding spices..."

# Seed your database here
Message.create([
    {
      body: "Morning run",
      username: "Liza"
    },
    {
      body: "Hi!",
      username: "Duane"
    },
    {
      body: "let's get this chat app working",
      username: "Liza"
    },
    {
      body: "ngl, this looks like a lot 😬",
      username: "Duane"
    },
    {
      body: "You got this! 💪",
      username: "Liza"
    }
  ])
  

puts "✅ Done seeding!"
