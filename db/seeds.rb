require 'faker'

puts "🔥 Deleting existing data and 🔢 Resetting IDs..."
HeroPower.delete_all
Power.delete_all
Hero.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE heros RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE powers RESTART IDENTITY CASCADE")
puts "🗑️  Deleted all existing data..."


puts "🌱 Seeding new data..."
puts "🦸 Creating powers..."
# Create powers
powers = []
30.times do
  powers << Power.create(
    name: Faker::Superhero.power,
    description: Faker::ChuckNorris.fact
  )
end
puts "✅ Created #{powers.count} powers"

# Create heroes
100.times do
  hero = Hero.create(
    name: Faker::Name.name,
    super_name: Faker::Superhero.name
  )

  # Assign random powers to hero
  powers.sample(rand(1..3)).each do |power|
    hero_power = HeroPower.new(hero: hero, power: power)
    hero_power.strength = %w[Strong Weak Average].sample
    hero_power.save
  end
end
puts "✅ Created #{Hero.count} heroes with powers!"



puts "✅ Done!"
