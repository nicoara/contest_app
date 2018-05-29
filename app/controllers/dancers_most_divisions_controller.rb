class DancersMostDivisionsController < ApplicationController
  def index
    boys = Couple.select("couples.boy_id as dancer_id, count(distinct(entries.division_id)) as total")
      .joins(:entries).group('boy_id').order('total DESC')
    girls = Couple.select("couples.girl_id as dancer_id, count(distinct(entries.division_id)) as total")
      .joins(:entries).group('girl_id').order('total DESC')

    @max_divisions = boys.length > 0 ? boys.first.total : 0
    @max_divisions = girls.length > 0 && girls.first.total > @max_divisions ? girls.first.total : @max_divisions

    @dancers_most_divisions = []
    dancers = [boys, girls]
    dancers.each do |dancer_list|
      dancer_list.each do |dancer|
        if dancer.total == @max_divisions
          @dancers_most_divisions.push(dancer.dancer_id)
        else
          break
        end
      end
    end
  end
end
