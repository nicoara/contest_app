class DancersMostCompetitionsController < ApplicationController
  def index
    boy_max = Couple
      .joins(:entries)
      .group('boy_id')
      .order('total DESC')
      .select("count(couples.boy_id) as total")
      .first

    girl_max = Couple
      .joins(:entries)
      .group('girl_id')
      .order('total DESC')
      .select("count(couples.girl_id) as total")
      .first

    @max_entries = boy_max != nil ? boy_max.total : 0
    @max_entries = girl_max != nil && girl_max.total > @max_entries ? girl_max.total : @max_entries

    boys = Couple
      .joins(:entries)
      .joins("LEFT JOIN dancers ON couples.boy_id = dancers.id")
      .group('boy_id')
      .having('count(couples.boy_id) == ' + @max_entries.to_s)
      .select("couples.boy_id as id, dancers.name as name")

    girls = Couple
      .joins(:entries)
      .joins("LEFT JOIN dancers ON couples.girl_id = dancers.id")
      .group('girl_id')
      .having('count(couples.girl_id) == ' + @max_entries.to_s)
      .select("couples.girl_id as id, dancers.name as name")

    @dancers_most_entries = [boys, girls].flatten

  end
end
