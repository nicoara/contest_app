# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

countries = ['Germany', 'Italy', 'Poland', 'Austria', 'Romania', 'Russia', 'Japan'];
lst_currencies = ['USD', 'EUR', 'RON', 'YEN', 'SEK']
prng = Random.new
nr_couples = 100


Agesection.create!(name: 'Adult')
Agesection.create!(name: 'Youth')
Agesection.create!(name: 'Senior I')
Agesection.create!(name: 'Senior II')
Agesection.create!(name: 'Senior III')

Division.create!(name: 'General')
Division.create!(name: 'Professional')

nr_couples.times do |n|
  country_id = prng.rand(countries.length)
  name = Faker::Name.unique.name
  gender = prng.rand(2) == 0 ? true : false
  Dancer.create!(name: name, country: countries[country_id], is_boy: gender)
end

nr_couples.times do |n|
  boy_id = prng.rand(nr_couples)
  girl_id = prng.rand(nr_couples)
  Couple.create(boy_id: boy_id, girl_id: girl_id)
end

20.times do |n|
  name = Faker::Lorem.word + " Competition"
  date = Date.today + rand(365)
  country_id = prng.rand(countries.length)
  price = prng.rand(500)
  currency_index = prng.rand(lst_currencies.length)
  max_couples = 6 + prng.rand(6)

  Competition.create(name: name,
    date: date,
    country: countries[country_id],
    price: price,
    currency: lst_currencies[currency_index],
    maxCouplesOnFloor: max_couples)
end

100.times do |n|

  couple_id = prng.rand(Couple.count)
  competition_id = prng.rand(Competition.count)
  division_id = prng.rand(Division.count)
  agesection_id = prng.rand(Agesection.count)

  Entry.create(couple_id: couple_id, competition_id: competition_id,
    division_id: division_id, agesection_id: agesection_id)
end


