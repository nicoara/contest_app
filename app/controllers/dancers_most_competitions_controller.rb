class DancersMostCompetitionsController < ApplicationController
  def index
    boys = Couple.select("couples.boy_id as id, count(couples.boy_id) as total")
      .joins(:entries).group('boy_id').order('total DESC')
    girls = Couple.select("couples.girl_id as id, count(couples.girl_id) as total")
      .joins(:entries).group('girl_id').order('total DESC')

    @max_entries = boys.length > 0 ? boys.first.total : 0
    @max_entries = girls.length > 0 && girls.first.total > @max_entries ? girls.first.total : @max_entries

    @dancers_most_entries = []
    dancers = [boys, girls]
    dancers.each do |dancer_list|
      dancer_list.each do |dancer|
        if dancer.total == @max_entries
          @dancers_most_entries.push(dancer.id)
        else
          break
        end
      end
    end
  end
end
