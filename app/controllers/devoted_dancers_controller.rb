class DevotedDancersController < ApplicationController
  def index
    boys = Couple
      .joins("LEFT JOIN dancers ON couples.boy_id = dancers.id")
      .group('boy_id')
      .having('count(boy_id)=1')
      .select('boy_id as id, dancers.name as name')
    girls = Couple
      .joins("LEFT JOIN dancers ON couples.girl_id = dancers.id")
      .group('girl_id')
      .having('count(girl_id)=1')
      .select('girl_id as id, dancers.name as name')
    @dancers = [boys , girls].flatten
  end
end
