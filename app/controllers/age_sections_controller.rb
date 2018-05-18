class AgeSectionsController < ApplicationController
  before_action :set_age_section, only: [:show, :edit, :update, :destroy]

  # GET /age_sections
  # GET /age_sections.json
  def index
    @age_sections = AgeSection.all
  end

  # GET /age_sections/1
  # GET /age_sections/1.json
  def show
  end

  # GET /age_sections/new
  def new
    @age_section = AgeSection.new
  end

  # GET /age_sections/1/edit
  def edit
  end

  # POST /age_sections
  # POST /age_sections.json
  def create
    @age_section = AgeSection.new(age_section_params)

    respond_to do |format|
      if @age_section.save
        format.html { redirect_to @age_section, notice: 'AgeSection was successfully created.' }
        format.json { render :show, status: :created, location: @age_section }
      else
        format.html { render :new }
        format.json { render json: @age_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /age_sections/1
  # PATCH/PUT /age_sections/1.json
  def update
    respond_to do |format|
      if @age_section.update(age_section_params)
        format.html { redirect_to @age_section, notice: 'AgeSection was successfully updated.' }
        format.json { render :show, status: :ok, location: @age_section }
      else
        format.html { render :edit }
        format.json { render json: @age_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /age_sections/1
  # DELETE /age_sections/1.json
  def destroy
    @age_section.destroy
    respond_to do |format|
      format.html { redirect_to age_sections_url, notice: 'AgeSection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_age_section
      @age_section = AgeSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def age_section_params
      params.require(:age_section).permit(:name)
    end
end
