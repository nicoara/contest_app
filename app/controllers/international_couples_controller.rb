class InternationalCouplesController < ApplicationController
  def index
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
end
