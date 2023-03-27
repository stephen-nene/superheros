require 'faker'

# Delete all existing data
HeroPower.delete_all
Power.delete_all
Hero.delete_all

# Create powers
powers = []
10.times do
  powers << Power.create(
    name: Faker::Superhero.power,
    description: Faker::ChuckNorris.fact
  )
end

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
