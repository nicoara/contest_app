class DataController < ApplicationController

  def index
  end

   def couples_diff_countries
    @title = 'Couples with dancers from different countries'

    lst_countries_ids = {}
    lst_countries = Dancer.pluck(:country).uniq
    lst_countries.each do |country|
      lst_countries_ids[country] = Dancer.where(country: country).pluck(:id)
    end

    @lst_couples = []
    Couple.find_each do |couple|
      lst_countries_ids.each do |country, country_ids|
        is_country_boy = country_ids.include? couple.boy_id
        is_country_girl = country_ids.include? couple.girl_id
        if is_country_boy or is_country_girl
          if is_country_boy == false || is_country_girl == false
            @lst_couples.push(couple)
          end
          break
        end
      end
    end

    @lst_couples
  end

  def dancers_in_one_couple
    @title = 'Dancers that have been in a couple with only one dancer'

    @lst_dancers = []
    Dancer.find_each do |dancer|
      nr_pairs_as_boy = Couple.where(boy_id: dancer.id).length
      nr_pairs_as_girl = Couple.where(girl_id: dancer.id).length
      if (nr_pairs_as_boy + nr_pairs_as_girl == 1)
        @lst_dancers.push(dancer)
      end
    end

    @lst_dancers
  end

  def dancer_with_most_competitions
    @title = 'Dancer with most competitions'

    @nr_entries_dancer = {}
    most_entries = 0
    @dancers_most_entries = []

    Entry.find_each do |entry|
      couple = Couple.find(entry.couple_id)
      dancer_ids = [couple.boy_id, couple.girl_id]

      for id in dancer_ids
        if @nr_entries_dancer.key?(id)
          @nr_entries_dancer[id] += 1
        else
          @nr_entries_dancer[id] = 1
        end

        if @nr_entries_dancer[id] >= most_entries

          if  @nr_entries_dancer[id] > most_entries
            @dancers_most_entries = [id]
          else
            @dancers_most_entries.push(id)
          end

          most_entries = @nrentries_dancer[id]
        end
      end
    end
  end

end
