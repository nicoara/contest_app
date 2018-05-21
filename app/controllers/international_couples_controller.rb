class InternationalCouplesController < ApplicationController
  def index
    @title = 'Couples with dancers from different countries'
    @lst_couples = Couple.select(:id)
      .joins("LEFT JOIN dancers as d ON couples.boy_id = d.id")
      .joins("LEFT JOIN dancers as d1 ON couples.girl_id = d1.id")
      .where("d.country != d1.country")
  end
end
