class CountryMostCouplesCompetitionsController < ApplicationController
  def index
    country_most_couples_competitions = Entry
    .joins(:couple)
    .joins("LEFT JOIN dancers ON couples.boy_id = dancers.id")
    .joins("LEFT JOIN dancers as d1 ON couples.girl_id = d1.id")
    .where('dancers.country = d1.country')
    .group('dancers.country').order('total DESC')
    .select("dancers.country as country, count(entries.id) as total")
    .first

    if country_most_couples_competitions != nil
      @country = country_most_couples_competitions.country
      @nr_dancers = country_most_couples_competitions.total
    end
  end
end
