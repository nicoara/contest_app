class CompetitionMostEarningsController < ApplicationController
  def index
    competition_most_earnings = Entry.select('entries.competition_id as id, sum(competitions.price) as earnings')
      .joins(:competition).group('entries.competition_id').order('earnings DESC').first

    if competition_most_earnings != nil
      @competition_id = competition_most_earnings.id
      @earnings = competition_most_earnings.earnings
    end
  end
end
