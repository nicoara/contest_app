class DataController < ApplicationController

  def index
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

          most_entries = @nr_entries_dancer[id]
        end
      end
    end
  end

end
