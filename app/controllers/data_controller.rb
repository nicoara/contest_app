class DataController < ApplicationController


  def index
    @query2_title = 'Couples with dancers from different countries'
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
    #it is simpler than making sql inner join statement
    @lstCouples = []
    Couple.find_each do |couple|
      if Dancer.find(couple.boy_id) != Dancer.find(couple.girl_id)
        @lstCouples.push(couple)
      end
    end

    @lstCouples
  end

  private
    def query1_params
      params.permit(:name)
    end

end
