class DancersController < ApplicationController
  before_action :set_dancer, only: [:show]

  def index
    @dancers = Dancer.all
  end

  def show
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
    def set_dancer
      @dancer = Dancer.find(params[:id])
    end

    def dancer_params
      params.require(:dancer).permit(:name, :country, :is_boy)
    end
end

