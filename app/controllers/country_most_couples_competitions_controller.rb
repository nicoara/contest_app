class CountryMostCouplesCompetitionsController < ApplicationController
  def index
    most_couples_competitions = Entry
    .joins(:couple)
    .joins("LEFT JOIN dancers ON couples.boy_id = dancers.id")
    .joins("LEFT JOIN dancers as d1 ON couples.girl_id = d1.id")
    .where('dancers.country = d1.country')
    .group('dancers.country')
    .order('total DESC')
    .select("count(entries.id) as total")
    .first

    if most_couples_competitions != nil
      @nr_dancers = most_couples_competitions.total

      @countries_most_couples_competitions = Entry
        .joins(:couple)
        .joins("LEFT JOIN dancers ON couples.boy_id = dancers.id")
        .joins("LEFT JOIN dancers as d1 ON couples.girl_id = d1.id")
        .where('dancers.country = d1.country')
        .group('dancers.country')
        .having('count(entries.id) == ' + @nr_dancers.to_s)
        .select("dancers.country as name")

    end
  end
end
