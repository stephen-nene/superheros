require 'faker'

puts "🔥 Deleting existing data..."
HeroPower.delete_all
Power.delete_all
Hero.delete_all

puts "🗑️  Deleted all existing data..."

puts "🌱 Seeding new data..."
# Reset primary key sequence to 1
ActiveRecord::Base.connection.reset_pk_sequence!('heroes')
ActiveRecord::Base.connection.reset_pk_sequence!('powers')
ActiveRecord::Base.connection.reset_pk_sequence!('hero_powers')


puts "🦸 Creating powers..."
# Create powers
powers = []
10.times do
  powers << Power.create(
    name: Faker::Superhero.power,
    description: Faker::ChuckNorris.fact
  )
end
puts "✅ Created #{powers.count} powers"

# Create heroes
30.times do
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

puts "🔢 Resetting IDs..."

# Reset ids
ActiveRecord::Base.connection.reset_pk_sequence!('heroes')
ActiveRecord::Base.connection.reset_pk_sequence!('powers')
ActiveRecord::Base.connection.reset_pk_sequence!('hero_powers')

puts "✅ Done!"
