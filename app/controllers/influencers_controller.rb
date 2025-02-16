class InfluencersController < ApplicationController
  def index
    @influencers = Influencer.all

    # Filtrar por búsqueda de texto
    if params[:query].present?
      @influencers = @influencers.where("username ILIKE ? OR fullname ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    # Filtrar por plataforma (ignorar si es "Todas")
    if params[:platform].present?
      @influencers = @influencers.where(platform: params[:platform].downcase)
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
