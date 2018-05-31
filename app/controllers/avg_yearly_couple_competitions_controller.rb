class AvgYearlyCoupleCompetitionsController < ApplicationController
  def index
    @couple_dancers = Couple
      .joins("LEFT JOIN dancers as d ON couples.boy_id = d.id")
      .joins("LEFT JOIN dancers as d1 ON couples.girl_id = d1.id")
      .select('couples.id as id, d.name as boy_name, d.id as boy_id, d1.name as girl_name, d1.id as girl_id')

    @couple_avg_yearly_competitions = {}
    Entry.all.each do |entry|
      if entry.created_at >= 36.months.ago
        @couple_avg_yearly_competitions[entry.couple_id] = @couple_avg_yearly_competitions.key?(entry.couple_id) ?
          @couple_avg_yearly_competitions[entry.couple_id] + 1 : 1
      end
    end
  end
end
