class DancerPartnersController < ApplicationController

  def show
    @id = dance_partner_params[:id]
    @dancer_partners = DancerPartners.of(@id)
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
