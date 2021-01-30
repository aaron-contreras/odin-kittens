# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Kitten.delete_all

CUTENESS_LEVELS = %w[very incredibly astronomically]
SOFTNESS_LEVELS = %w[silky fluffy puffy]

100.times do
  Kitten.create!(name: Faker::Creature::Cat.name,
                 age: rand(1..20),
                 cuteness: CUTENESS_LEVELS.sample,
                 softness: SOFTNESS_LEVELS.sample)
end
