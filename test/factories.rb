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
    association :boy, factory: :boy
    association :girl, factory: :girl
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
    sequence(:ranking)
  end

  factory :age_section do
    name    'Adult'
  end

  factory :entry do
    association :couple
    association :competition
    association :division
    association :age_section
  end
end

