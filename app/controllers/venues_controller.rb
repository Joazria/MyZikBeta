class VenuesController < ApplicationController
   before_action :set_venue, only: [:band_offers, :show, :edit, :update, :destroy]

  def index



    if params[:query].blank?
        @venues = Venue.all

         @markers = @venues.geocoded.map do |venue|
          {
            lat: venue.latitude,
            lng: venue.longitude,
            infoWindow: render_to_string(partial: "infowindow", locals: { venue: venue })
          }
          end
      else
        @results = Venue.where("venue_name ILIKE :query OR genero1 ILIKE :query OR genero2 ILIKE :query OR genero3 ILIKE :query", query: "%#{params[:query]}%")

         @markers = @results.geocoded.map do |venue|
          {
            lat: venue.latitude,
            lng: venue.longitude,
            infoWindow: render_to_string(partial: "infowindow", locals: { venue: venue })
          }
          end
      end

  end

  def show

     @venues = Venue.where(id: params[:id]).where.not(latitude: nil, longitude: nil)
      @markers = @venues.geocoded.map do |venue|
        {
          lat: venue.latitude,
          lng: venue.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { venue: venue })
        }
      end
  end
  def new
    @venue = Venue.new
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to @venue, notice: "Your venue was successfully created."
    else
      render :new
    end
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue, notice: "Your venue was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to root_path, notice: "Your venue was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_venue
    @venue = Venue.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def venue_params
  params.require(:venue).permit(:name, :release, :site, :fb, :insta, :line_up, :email,
                    :tel,  :venue_name, :photo, :latitude, :longitude, :address, :genero1, :genero2, :genero3, :genero4, :genero5, :genero6, :ticket,
                                                                :name2,
                              :email2,
                              :tel2, :capacity, :confirmation)
  end
end
