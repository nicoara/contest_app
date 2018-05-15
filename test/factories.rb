# This will guess the User class
FactoryBot.define do

  factory :dancer do
    name 'Benedetto'
    country 'Germany'
    is_boy  true
  end

  factory :couple do
    association :boy_id, factory: :dancer, id: 1
    association :girl_id, factory: :dancer, id: 2
  end

  factory :competition do
    name      'World Open'
    date      2018-03-25
    country   'Italy'
    price     200
    currency  'eur'
    maxCouplesOnFloor   7
  end

  factory :division do
    name    'Professional'
  end

  factory :agesection do
    name    'Adult'
  end

  factory :entry do
    association :couple_id, factory: :couple, id: 1
    association :competition_id, factory: :competition, id: 1
    association :division_id, factory: :division, id: 1
    association :agesection_id, factory: :agesection, id: 1
  end
end

