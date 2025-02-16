class InfluencersController < ApplicationController
  def index
    if params[:query].present?
      @influencers = Influencer.where("LOWER(username) LIKE ?", "%#{params[:query].downcase}%")
    else
      @influencers = Influencer.all
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
