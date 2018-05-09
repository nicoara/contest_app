# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

countries = ['Germany', 'Italy', 'Poland', 'Austria', 'Romania', 'Russia', 'Japan'];
lstCurrencies = ['USD', 'EUR', 'RON', 'YEN', 'SEK']
prng = Random.new
nrPairs = 20


Agesection.create!(name: 'Adult')
Agesection.create!(name: 'Youth')
Agesection.create!(name: 'Senior I')
Agesection.create!(name: 'Senior II')
Agesection.create!(name: 'Senior III')

Division.create!(name: 'General')
Division.create!(name: 'Professional')

nrPairs.times do |n|
  randomCountry = prng.rand(countries.length)
  name = Faker::Name.unique.name
  randomGender = prng.rand(2)
  gender = true
  if (randomGender == 0)
    gender = false
  end
  Dancer.create!(name: name, country: countries[randomCountry], is_boy: gender)
end

nrPairs.times do |n|
  randomBoy = prng.rand(nrPairs)
  randomGirl = prng.rand(nrPairs)
  Couple.create(boy_id: randomBoy, girl_id: randomGirl)
end

20.times do |n|
  randomName = Faker::Lorem.word + " Competition"
  randomDate = Date.today+rand(365)
  randomCountry = prng.rand(countries.length)
  randomPrice = prng.rand(500)
  randomCurrencyIndex = prng.rand(lstCurrencies.length)
  randomMaxCouples = 6 + prng.rand(6)

  Competition.create(name: randomName,
    date: randomDate,
    country: countries[randomCountry],
    price: randomPrice,
    currency: lstCurrencies[randomCurrencyIndex],
    maxCouplesOnFloor: randomMaxCouples)
end

nrPairs.times do |n|
  randomCouple = prng.rand(Couple.all.length)
  randomCompetition = prng.rand(Competition.all.length)
  randomDivision = prng.rand(Division.all.length)
  randomAgesection = prng.rand(Agesection.all.length)

  Entry.create(couple_id: randomCouple, competition_id: randomCompetition,
    division_id: randomDivision, agesection_id: randomAgesection)
end


