class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :edit, :update, :destroy]


def show
    @band = Band.find(params[:band_id])
end

def new
    @gig = Gig.new
    @band = Band.find(params[:band_id])
end

  def create
    @band = Band.find(params[:band_id])
    @gig = Gig.new(gig_params)
    @gig.band = @band
    if @gig.save
      redirect_to @band, notice: "Your gig was successfully created."
    else
      render :new
    end
  end

  def update
    @band = Band.find(params[:id])
    if @gig.update(gig_params)
      redirect_to @band, notice: "The gig was successfully updated."
    else
      redirect_to root_path
    end
  end

  def destroy
    @gig.destroy
    redirect_to root_path, notice: "The Gig was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gig
    @gig = Gig.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def gig_params
    params.require(:gig).permit(:date, :gate_opening, :showtime, :duration, :local, :address, :state, :country, :website, :release)
  end
end
