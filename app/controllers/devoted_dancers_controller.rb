class DevotedDancersController < ApplicationController
  def index
    boys = Couple
      .group('boy_id')
      .having('count(boy_id)=1')
      .select('boy_id as id')
    girls = Couple
      .group('girl_id')
      .having('count(girl_id)=1')
      .select('girl_id as id')
    @lst_dancers = [boys , girls].flatten
  end
end
