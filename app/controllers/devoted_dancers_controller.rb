class DevotedDancersController < ApplicationController
  def index
    boys = Couple.select('boy_id as id').group('boy_id').having('count(boy_id)=1')
    girls = Couple.select('girl_id as id').group('girl_id').having('count(girl_id)=1')
    @lst_dancers = [boys , girls].flatten
  end
end
