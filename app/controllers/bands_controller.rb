class BandsController < ApplicationController
    before_action :set_band, only: [:band_offers, :show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [ :show, :index ]

  def index

    if params[:query].present?
      @bands = Band.where("name ILIKE :query", query: "%#{params[:query]}%")
    else
      @bands = Band.all
    end


    @searchable_bands = []
      Band.all.order('name ASC').each do |band|
        @searchable_bands << band.name
      end

   
    
  end

  def show
    @bands = Band.where(agency_id: @band.agency_id)
    @bookings = Booking.where(validation: 'DEAL')
  end

  def new
    @band = Band.new
  end

  def edit
    unless current_user.email == 'joa.azria@gmail.com' || current_user.id == @band.user_id
      redirect_to root_path, notice: 'Unauthorized Area'
    end
  end

  def create
    @band = Band.new(band_params)
    @band.user = current_user
    @band.agency = current_user.agency
    if @band.save
      redirect_to @band, notice: "Your band was successfully created."
    else
      render :new
    end
  end

  def update
    if @band.update(band_params)
      redirect_to @band, notice: "Your Band was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @band.destroy
    redirect_to root_path, notice: "Your band was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_band
    @band = Band.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def band_params
  params.require(:band).permit(:name,
                              :agency,
                              :release,
                              :website,
                              :instagram,
                              :youtube,
                              :spotify,
                              :genero1,
                              :genero2,
                              :genero3,
                              :genero4,
                              :email,
                              :city,
                              :state,
                              :country,
                              :team,
                              :yt_video_two,
                              :yt_video_one,
                              :yt_video_three,
                              :destak_discr,
                              :yt_video_destak,
                              :headline, 
                              :photo)
  end
end
