# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

countries = ['Germany', 'Italy', 'Poland', 'Austria', 'Romania', 'Russia', 'Japan'];
currencies = ['USD', 'EUR', 'RON', 'YEN', 'SEK']
prng = Random.new
nr_couples = 5000

puts Time.now

AgeSection.create!(name: 'Adult')
AgeSection.create!(name: 'Youth')
AgeSection.create!(name: 'Senior I')
AgeSection.create!(name: 'Senior II')
AgeSection.create!(name: 'Senior III')

Division.create!(name: 'Amateur', ranking: 1)
Division.create!(name: 'General', ranking: 2)
Division.create!(name: 'Professional', ranking: 3)
Division.create!(name: 'Performance', ranking: 4)

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
  boy_ids = Dancer.where(is_boy: true).select(:id)
  index_boy = prng.rand(boy_ids.length)
  girl_ids = Dancer.where(is_boy: false).select(:id)
  index_girl = prng.rand(girl_ids.length)

  Couple.create(boy_id: boy_ids[index_boy].id,
    girl_id: girl_ids[index_girl].id)

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
  currency_index = prng.rand(currencies.length)
  max_couples = 6 + prng.rand(6)

  Competition.create!(name: name,
    date: date,
    country: countries[country_id],
    price: price,
    currency: currencies[currency_index],
    max_couples_on_floor: max_couples)
end

puts 'ended adding Competitions'
puts Time.now

nr_couples.times do |n|

  couple_id = 1 + prng.rand(Couple.count)
  competition_id = 1 + prng.rand(Competition.count)
  division_id = 1 + prng.rand(Division.count)
  age_section_id = 1 + prng.rand(AgeSection.count)

  Entry.create(couple_id: couple_id, competition_id: competition_id,
    division_id: division_id, age_section_id: age_section_id) #no bang bc may not pass uniqueness validation couple, competition

  if (Entry.count % 300 == 0)
    puts "#{Entry.count} entries"
  end
end

puts 'ended adding Entries'
puts Time.now

