class DancerPartnersController < ApplicationController

  def show
    @id = dancepartner_params[:id]
    dancer = Dancer.find(@id)
    lst_partnerid = dancer.is_boy == true ?
      Couple.where(boy_id: @id).select(:girl_id) :
      Couple.where(girl_id: @id).select(:boy_id)
    @dancer_partners = Dancer.where('id IN (?)', lst_partnerid)
  end

  def new
    @dancer_partner = ''
  end

  def create
    redirect_to dancer_partner_url id: dancepartner_params[:id]
  end

    private
      def dancepartner_params
        params.permit(:id)
      end

end
