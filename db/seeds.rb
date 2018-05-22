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
nr_couples = 5000

puts Time.now

Agesection.create!(name: 'Adult')
Agesection.create!(name: 'Youth')
Agesection.create!(name: 'Senior I')
Agesection.create!(name: 'Senior II')
Agesection.create!(name: 'Senior III')

Division.create!(name: 'General')
Division.create!(name: 'Professional')

puts 'started adding Dancers'

nr_couples.times do |n|
  country_id = prng.rand(countries.length)
  name = Faker::Name.unique.name
  gender = prng.rand(2) == 0 ? true : false
  Dancer.create!(name: name, country: countries[country_id], is_boy: gender)
  if (Dancer.count % 300 == 0)
    puts "#{Dancer.count} dancers"
  end
end

puts 'ended adding Dancers'
puts Time.now

nr_couples.times do |n|
  lst_boyid = Dancer.where(is_boy: true).select(:id)
  index_boy = prng.rand(lst_boyid.length)
  lst_girlid = Dancer.where(is_boy: false).select(:id)
  index_girl = prng.rand(lst_girlid.length)

  Couple.create(boy_id: lst_boyid[index_boy].id,
    girl_id: lst_girlid[index_girl].id)

  if (Couple.count % 300 == 0)
    puts "#{Couple.count} couples"
  end
end

puts 'ended adding Couples'
puts Time.now

100.times do |n|
  name = Faker::Lorem.word + " Competition"
  date = Date.today + rand(365)
  country_id = prng.rand(countries.length)
  price = prng.rand(500)
  currency_index = prng.rand(lst_currencies.length)
  max_couples = 6 + prng.rand(6)

  Competition.create!(name: name,
    date: date,
    country: countries[country_id],
    price: price,
    currency: lst_currencies[currency_index],
    max_couples_on_floor: max_couples)
end

puts 'ended adding Competitions'
puts Time.now

nr_couples.times do |n|

  couple_id = 1 + prng.rand(Couple.count)
  competition_id = 1 + prng.rand(Competition.count)
  division_id = 1 + prng.rand(Division.count)
  age_section_id = 1 + prng.rand(Agesection.count)

  Entry.create(couple_id: couple_id, competition_id: competition_id,
    division_id: division_id, age_section_id: age_section_id) #no bang bc may not pass uniqueness validation couple, competition

  if (Entry.count % 300 == 0)
    puts "#{Entry.count} entries"
  end
end

puts 'ended adding Entries'
puts Time.now

