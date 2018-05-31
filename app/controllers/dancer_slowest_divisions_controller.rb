class DancerSlowestDivisionsController < ApplicationController

  #mod de calcul:
  #DX: data la care un dansator a participat prima oară la categoria X
  #viteza:
  # pentru dasatorii care au participat la o singură categorie, este infinit
  # pentru dansatorii care au participat la mai multe categorii:
  # V = (Y-X)/(DY-DX)
  # unde
  # * X e categoria cea mai slabă la care a participat vreodată
  # * Y e categoria cea mai tare la care a participat vreodată
  def index
    boy_entries = Couple
      .joins(:entries)
      .select("couples.boy_id as dancer_id, entries.division_id as division_id, entries.created_at")
    girl_entries = Couple
      .joins(:entries)
      .select("couples.girl_id as dancer_id, entries.division_id as division_id, entries.created_at")

    dancer_multiple_divisions = false
    dancer_division_dates = {}
    entries = [boy_entries, girl_entries]
    entries.each do |entries_gender|
      entries_gender.each do |entry|
        if dancer_division_dates.key?(entry.dancer_id)
          if dancer_division_dates[entry.dancer_id].key?(entry.division_id)
            if entry.created_at < dancer_division_dates[entry.dancer_id][entry.division_id]
              dancer_division_dates[entry.dancer_id][entry.division_id] = entry.created_at
            end
          else
            dancer_division_dates[entry.dancer_id][entry.division_id] = entry.created_at
            if dancer_multiple_divisions == false && dancer_division_dates[entry.dancer_id].keys.length > 1
              dancer_multiple_divisions = true
            end
          end
        else
          dancer_division_dates[entry.dancer_id] = { entry.division_id => entry.created_at}
        end
      end
    end

    @slowest_dancers = Dancer.where(id: slowest_dancer_ids(dancer_division_dates, dancer_multiple_divisions))
  end

  private
    def slowest_dancer_ids(dancer_division_dates, dancer_multiple_divisions)
      if dancer_multiple_divisions == false
        return dancer_division_dates.keys
      end

      slowest_dancer_ids = []
      slowest_time = nil
      dancer_division_dates.each do |dancer_id, division_dates|
        if division_dates.keys.length > 1
          dancer_time = dancer_time(division_dates)
          if dancer_time > 0 # <0 means a dancer went down in division strength in time
            if slowest_time == nil
              slowest_time = dancer_time
              slowest_dancer_ids = [dancer_id]
            else
              if dancer_time < slowest_time
                slowest_time = dancer_time
                slowest_dancer_ids = [dancer_id]
              elsif dancer_time == slowest_time
                slowest_dancer_ids.push(dancer_id)
              end
            end
          end
        end
      end
      puts '------slowest_dancer_ids', slowest_dancer_ids
      return slowest_dancer_ids
    end

    def dancer_time(division_dates)
      return (division_dates.keys.max - division_dates.keys.min) /
        (division_dates[division_dates.keys.max] - division_dates[division_dates.keys.min])
    end
end
