class InternationalCouplesController < ApplicationController
  def index
    @couples = Couple
      .joins("LEFT JOIN dancers as d ON couples.boy_id = d.id")
      .joins("LEFT JOIN dancers as d1 ON couples.girl_id = d1.id")
      .where("d.country != d1.country")
      .select('couples.id as id, d.name as boy_name, d.id as boy_id, d1.name as girl_name, d1.id as girl_id')
  end
end
