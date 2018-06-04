class AvgYearlyCoupleCompetitionsController < ApplicationController
  def index
    @couple_avg_yearly_competitions = Entry
      .joins(:couple)
      .joins("LEFT JOIN dancers as d ON couples.boy_id = d.id")
      .joins("LEFT JOIN dancers as d1 ON couples.girl_id = d1.id")
      .where('entries.created_at >= ?', 36.months.ago)
      .group(:couple_id)
      .select('entries.couple_id as id, count(entries.couple_id) as total, d.name as boy_name, d.id as boy_id, d1.name as girl_name, d1.id as girl_id')
  end
end
