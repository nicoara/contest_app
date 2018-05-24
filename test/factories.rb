FactoryBot.define do

  factory :dancer do
    name 'Benedetto'
    country 'Germany'
    is_boy  true

    trait :boy do
      is_boy true
    end

    trait :girl do
      is_boy false
    end

    factory :boy,   traits: [:boy]
    factory :girl,  traits: [:girl]
  end

  factory :couple do
    association :boy_id, factory: :dancer
    association :girl_id, factory: :dancer
  end

  factory :competition do
    name      'World Open'
    date      { 2.years.ago }
    country   'Italy'
    price     200
    currency  'eur'
    max_couples_on_floor   7
  end

  factory :division do
    name    'Professional'
    ranking  1
  end

  factory :age_section do
    name    'Adult'
  end

  factory :entry do
    association :couple_id, factory: :couple, id: 1
    association :competition_id, factory: :competition, id: 1
    association :division_id, factory: :division, id: 1
    association :age_section_id, factory: :age_section, id: 1
  end
end

