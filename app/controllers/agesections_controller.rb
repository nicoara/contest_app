class AgesectionsController < ApplicationController
  before_action :set_agesection, only: [:show, :edit, :update, :destroy]

  # GET /agesections
  # GET /agesections.json
  def index
    @agesections = Agesection.all
  end

  # GET /agesections/1
  # GET /agesections/1.json
  def show
  end

  # GET /agesections/new
  def new
    @agesection = Agesection.new
  end

  # GET /agesections/1/edit
  def edit
  end

  # POST /agesections
  # POST /agesections.json
  def create
    @agesection = Agesection.new(agesection_params)

    respond_to do |format|
      if @agesection.save
        format.html { redirect_to @agesection, notice: 'Agesection was successfully created.' }
        format.json { render :show, status: :created, location: @agesection }
      else
        format.html { render :new }
        format.json { render json: @agesection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agesections/1
  # PATCH/PUT /agesections/1.json
  def update
    respond_to do |format|
      if @agesection.update(agesection_params)
        format.html { redirect_to @agesection, notice: 'Agesection was successfully updated.' }
        format.json { render :show, status: :ok, location: @agesection }
      else
        format.html { render :edit }
        format.json { render json: @agesection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agesections/1
  # DELETE /agesections/1.json
  def destroy
    @agesection.destroy
    respond_to do |format|
      format.html { redirect_to agesections_url, notice: 'Agesection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agesection
      @agesection = Agesection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agesection_params
      params.require(:agesection).permit(:name)
    end
end
