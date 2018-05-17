class CouplesController < ApplicationController
  before_action :set_couple, only: [:show, :edit, :update]

  def index
    @couples = Couple.all
  end


  # GET /couple/1
  # GET /couple/1.json
  def show
  end

  def new
    @couple = Couple.new
    @boys = Dancer.where(is_boy: true)
    @girls = Dancer.where(is_boy: false)
  end

  # GET /couples/1/edit
  def edit
    @boys = Dancer.where(is_boy: true)
    @girls = Dancer.where(is_boy: false)
  end

  def create
    @couple = Couple.new(couple_params)
    if @couple.save
      redirect_to couples_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /couple/1
  # PATCH/PUT /couple/1.json
  def update
    respond_to do |format|
      if @couple.update(couple_params)
        format.html { redirect_to @couple, notice: 'couple was successfully updated.' }
        format.json { render :show, status: :ok, location: @couple }
      else
        format.html { render :edit }
        format.json { render json: @couple.errors, status: :unprocessable_entity }
      end
    end
  end

  private
      # Use callbacks to share common setup or constraints between actions.
    def set_couple
      @couple = Couple.find(params[:id])
    end

    def couple_params
      params.require(:couple).permit(:boy_id, :girl_id)
    end
end
