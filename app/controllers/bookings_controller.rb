class BookingsController < ApplicationController

 before_action :set_booking, only: [:show, :edit, :update, :destroy]

def index
  @agency = Agency.where(user_id: current_user)
  @bands = Band.where(agency_id: @agency)
  @festivals = Festival.all
  @venues = Venue.all
   
  @all_venues = []
 @venues.order('venue_name ASC').map do |venue|
    @all_venues  << venue.venue_name
  end

  @all_festivals = []
 @festivals.order('festival_name ASC').map do |festival|
    @all_festivals  << festival.festival_name
 end
 
 if current_user.email == "joa.azria@gmail.com"
    @bookings = Booking.all

  else
    @bookings = Booking.where(user_id: current_user.id)
  end
  
      @bookable_bands = []
      if params[:query].present?
        @bands = Band.where("name ILIKE :query", query: "%#{params[:query]}%")
        @band = @bands.first
        @bookings = Booking.where('showtime > ?', Date.today).order(showtime: :asc).where(band: @band.id)
     
      end
     if current_user.email == "joa.azria@gmail.com"
        Band.all.order('name ASC').each do |band|
          @bookable_bands  << band.name
        end
      else 
        @bands.each do |band|
          @bookable_bands  << band.name
        end
      end
      



end


def show
    # @booking = Booking.find(params[:band_id])

      @markers = @booking.bookable.geocode.map do |bookable|
        {
          lat: @booking.bookable.latitude,
          lng: @booking.bookable.longitude,
           # infoWindow: render_to_string(partial: "infowindow", locals: { bookable: bookable })
        }
      end

end

def new
    @festival = Festival.find(params[:festival_id])
    @booking = Booking.new
end

  def create
    @booking = Booking.new

    if params[:festival_id]
      @festival = Festival.find(params[:festival_id])
      @booking.bookable = @festival
    end
    if params[:venue_id]
        @venue = Venue.find(params[:venue_id])
          @booking.bookable = @venue
    end

    @band = current_user.bands.last
    # @booking.bookable.band = @band
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, notice: "Your booking was successfully created."
    else
      redirect_to root_path, notice: "Something goes wrong ..."
    end
  end

  def edit
        @band_filter = []
        Band.where(user_id: current_user.id).each do |band|
          @band_filter << band
          end
  end

  def update

    if @booking.validation == "DEAL"
      redirect_to booking_path, notice: "Congrats ! For your New Show!"

    elsif @booking.update(booking_params)
      redirect_to bookings_path, notice: "The booking was successfully updated."

    else
      redirect_to root_path
    end

  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: "The Booking was successfully destroyed."
  end



#NEWVISUAL


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end


  # Only allow a trusted parameter "white list" through.
  def booking_params
    params.require(:booking).permit(:progress,
                                  :stage,
                                  :showtime,
                                  :fee,
                                  :backline,
                                  :transporte,
                                  :hotel,
                                  :food,
                                  :feedback,
                                  :next,
                                  :bookable_id,
                                  :when,
                                  :band,
                                  :validation)


  end
end
