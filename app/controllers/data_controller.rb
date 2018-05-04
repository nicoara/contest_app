class DataController < ApplicationController
  def index
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

  private
    def query1_params
      params.permit(:name)
    end

end
