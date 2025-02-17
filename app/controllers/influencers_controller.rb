class InfluencersController < ApplicationController
  def create
    @influencer = Influencer.new(influencer_params)

    if @influencer.save
      flash[:notice] = "Influencer agregado correctamente"
      respond_to do |format|
        format.html { redirect_to influencers_path }
        format.turbo_stream
      end
    else
      flash.now[:alert] = "No se pudo agregar el influencer"
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("flash_messages", partial: "shared/flash")
        end
      end
    end
  end


  def index
    @influencers = Influencer.all

    if params[:query].present?
      @influencers = @influencers.where("username ILIKE ?", "%#{params[:query]}%")
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

  private

  def influencer_params
    params.permit([ :username, :fullname, :platform, :followers, :verified, :picture ]).to_h
  end
end
