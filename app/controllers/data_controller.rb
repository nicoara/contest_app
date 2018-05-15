class DataController < ApplicationController

  def index
    @couples_diff_countries_title = 'Couples with dancers from different countries'
    @dancers_in_one_couple_title = 'Dancers that have been in a couple with only one dancer'
    @dancer_with_most_competitions_title = 'Dancer with most competitions'
  end

  def couples_diff_countries
    @title = 'Couples with dancers from different countries'

    @lst_couples = []
    Couple.find_each do |couple|
      if Dancer.find(couple.boy_id).country != Dancer.find(couple.girl_id).country
        @lst_couples.push(couple)
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

    @nrentries_dancer = {}
    most_entries = 0
    @dancers_most_entries = []

    Entry.find_each do |entry|
      couple = Couple.find(entry.couple_id)
      dancer_ids = [couple.boy_id, couple.girl_id]

      for id in dancer_ids
        if @nrentries_dancer.key?(id)
          @nrentries_dancer[id] += 1
        else
          @nrentries_dancer[id] = 1
        end

        if @nrentries_dancer[id] >= most_entries

          if  @nrentries_dancer[id] > most_entries
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
