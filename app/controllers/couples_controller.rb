class CouplesController < ApplicationController
  def index
    @couples = Couple.all
  end

  def new
    @couple = Couple.new
  end

  def create
    @couple = Couple.new(couple_params)
    if @couple.save
      redirect_to couples_path
    else
      render 'new'
    end
  end

  private
    def couple_params
      params.require(:couple).permit(:boy_id, :girl_id)
    end
end
