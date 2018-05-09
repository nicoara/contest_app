class DataController < ApplicationController

  def index
    @query2_title = 'Couples with dancers from different countries'
    @query3_title = 'Dancers that have been in a couple with only one dancer'
  end

  def query1
    @dancername = ''
    #debugger
  end

  def query1_post
    #Benedetto Ferruggia
    dancername = query1_params[:name]
    dancer = Dancer.where(name: dancername)

    if dancer.empty?
      @error = 'no dancer found'
    else
      id = dancer[0].id
      lstGirlIds = Couple.select('girl_id').where('boy_id IN (?)', id)
      if lstGirlIds.empty?
        @error = 'no partners'
      else
        @partners = Dancer.where('id IN (?)', lstGirlIds)
      end

    end
  end

  def query2
    @query2_title = 'Couples with dancers from different countries'

    @lstCouples = []
    Couple.find_each do |couple|
      if Dancer.find(couple.boy_id).country != Dancer.find(couple.girl_id).country
        @lstCouples.push(couple)
      end
    end

    @lstCouples
  end

  def query3
    @query3_title = 'Dancers that have been in a couple with only one dancer'

    @lstDancers = []
    Dancer.find_each do |dancer|
      nr_pairs_as_boy = Couple.where(boy_id: dancer.id).length
      nr_pairs_as_girl = Couple.where(girl_id: dancer.id).length
      if (nr_pairs_as_boy + nr_pairs_as_girl == 1)
        @lstDancers.push(dancer)
      end
    end

    @lstDancers
  end

  private
    def query1_params
      params.permit(:name)
    end

end
