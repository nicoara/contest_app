class DancersMostDivisionsController < ApplicationController
  def index
    boys = Couple
      .joins(:entries)
      .joins("LEFT JOIN dancers ON couples.boy_id = dancers.id")
      .group('boy_id')
      .order('total DESC')
      .select("couples.boy_id as id, count(distinct(entries.division_id)) as total, dancers.name as name")
    girls = Couple
      .joins(:entries)
      .joins("LEFT JOIN dancers ON couples.boy_id = dancers.id")
      .group('girl_id')
      .order('total DESC')
      .select("couples.girl_id as id, count(distinct(entries.division_id)) as total, dancers.name as name")

    @max_divisions = boys.length > 0 ? boys.first.total : 0
    @max_divisions = girls.length > 0 && girls.first.total > @max_divisions ? girls.first.total : @max_divisions

    @dancers_most_divisions = []
    dancers = [boys, girls]
    dancers.each do |dancer_list|
      dancer_list.each do |dancer|
        if dancer.total == @max_divisions
          @dancers_most_divisions.push(dancer)
        else
          break
        end
      end
    end
  end
end
