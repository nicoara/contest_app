class CompetitionsMostEarningsController < ApplicationController
  def index
    most_earnings = Entry
      .joins(:competition)
      .group('entries.competition_id')
      .order('earnings DESC')
      .select('sum(competitions.price) as earnings')
      .first

    if most_earnings != nil
      @earnings = most_earnings.earnings

      @competitions_most_earnings = Entry
        .joins(:competition)
        .group('entries.competition_id')
        .having('sum(competitions.price) == ' + most_earnings.earnings.to_s)
        .select('competitions.id as id, competitions.name as name')
    end
  end
end
