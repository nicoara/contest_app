class DancersMostAgeSectionsController < ApplicationController
  def index
    boys = Couple
      .joins(:entries)
      .joins("LEFT JOIN dancers ON couples.boy_id = dancers.id")
      .group('boy_id')
      .order('total DESC')
      .select("couples.boy_id as id, count(distinct(entries.age_section_id)) as total, dancers.name as name")
    girls = Couple
      .joins(:entries)
      .joins("LEFT JOIN dancers ON couples.girl_id = dancers.id")
      .group('girl_id')
      .order('total DESC')
      .select("couples.girl_id as id, count(distinct(entries.age_section_id)) as total, dancers.name as name")

    @max_age_sections = boys.length > 0 ? boys.first.total : 0
    @max_age_sections = girls.length > 0 && girls.first.total > @max_age_sections ? girls.first.total : @max_age_sections

    @dancers_most_age_sections = []
    dancers = [boys, girls]
    dancers.each do |dancer_list|
      dancer_list.each do |dancer|
        if dancer.total == @max_age_sections
          @dancers_most_age_sections.push(dancer)
        else
          break
        end
      end
    end
  end
end
