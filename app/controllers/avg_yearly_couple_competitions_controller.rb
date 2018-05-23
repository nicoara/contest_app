class AvgYearlyCoupleCompetitionsController < ApplicationController
  def index
    couple_yearly_competitions = {}

    Entry.all.each do |entry|
      if couple_yearly_competitions.key?(entry.couple_id)
        if couple_yearly_competitions[entry.couple_id].key?(entry.created_at.year)
          couple_yearly_competitions[entry.couple_id][entry.created_at.year] += 1
        else
          couple_yearly_competitions[entry.couple_id][entry.created_at.year] = 1
        end
      else
        couple_yearly_competitions[entry.couple_id] = { entry.created_at.year => 1}
      end
    end

    @couple_avg_yearly_competitions = {}
    couple_yearly_competitions.each do |couple_id, competitions_couple|
      total_competitions = 0
      competitions_couple.each do |year, competitions|
        total_competitions += competitions
      end
      total_competitions /= (competitions_couple.length).to_f
      @couple_avg_yearly_competitions[couple_id] = total_competitions
    end

  end
end
