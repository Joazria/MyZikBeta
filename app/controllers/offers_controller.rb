class OffersController < ApplicationController
 before_action :set_offer, only: [:show, :edit, :update, :destroy]
 before_action :set_band, only: [:new, :create, :update]


  def show
      @offers = Offer.all
      @bands = Band.all
      @gigs = Gig.all

  end

  def new
    @offer = Offer.new
  end

  def create

    @offer = Offer.new(offer_params)
    @offer.band = @band
    @offer.user = current_user
    if @offer.save
      redirect_to  profile_path, notice: "Your offer was successfully send."
    else
      render :new
    end
  end


  def update
    if @offer.update(offer_params)
      redirect_to @band, notice: "The offer was successfully updated."
    else
      redirect_to root_path
    end
  end


  def destroy
    @offer.destroy
    redirect_to root_path, notice: "Your offer was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end

  def set_band
    @band = Band.find(params[:band_id])
  end
  # Only allow a trusted parameter "white list" through.
  def offer_params
    params.require(:offer).permit(
      :event_name,
      :local,
      :date,
      :show_time,
      :release,
      :line_up,
      :fee,
      :format,
      :patrocino,
      :address,
      :transport,
      :accommodation,
      :perdiem,
      :backline,
      :capacity,
      :link_do_event,
      :streaming,
      :ticket
      )
   end
end


