class DancerPartnersController < ApplicationController

  def show
    @id = dance_partner_params[:id]
    @dancer_partners = DancerPartners.of(@id)
  end

  def new
    @dancer_partner = ''
    @dancers = Dancer.select(:id, :name).all
  end

  def create
    redirect_to dancer_partner_url id: dance_partner_params[:id]
  end

    private
      def dance_partner_params
        params.permit(:id)
      end

end

