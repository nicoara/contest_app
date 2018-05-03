class DancersController < ApplicationController
  def index
    @dancers = Dancer.all
  end

  def new
    @dancer = Dancer.new
  end

  def create
    @dancer = Dancer.new(dancer_params)
    if @dancer.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

    def dancer_params
      params.require(:dancer).permit(:name, :country)
    end
end

