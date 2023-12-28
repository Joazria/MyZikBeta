class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about_us, :terms, :privacy ]

  def home

    if params[:query].present?
      @bands = Band.search_by_name(params[:query])
      @festivals = Festival.search_by_name(params[:query])
      @venues = Venue.search_by_name(params[:query])
      @agencies = Agency.search_by_company(params[:query])

      # @favorite_festivals = current_user.favorited_by_type('Festival')


    else
      @agencies = Agency.all
      @bookings = Booking.where(validation: 'DEAL')
      @infos = Info.all
      @bands = Band.all
      @festivals = Festival.all
      @venues = Venue.all
      @users_approved = User.all
      #@users_approved = User.where(status: 'approved').sort_by { |event| [event.created_at] }.reverse


    end
      @festivals = Festival.where.not(latitude: nil, longitude: nil)
      @markers = @festivals.geocoded.map do |festival|
      {
        lat: festival.latitude,
        lng: festival.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { festival: festival })
      }
   end
  end

  def about_us
    @bands = Band.all
  end
  def map_venues
    if params[:query].blank?
      @venues = Venue.all

       @markers = @venues.geocoded.map do |venue|
        {
          lat: venue.latitude,
          lng: venue.longitude,
          infoWindow: render_to_string(partial: "infowindowvenue", locals: { venue: venue })
        }
        end
    else
      @results = Venue.where("venue_name ILIKE :query OR genero1 ILIKE :query OR genero2 ILIKE :query OR genero3 ILIKE :query", query: "%#{params[:query]}%")

       @markers = @results.geocoded.map do |venue|
        {
          lat: venue.latitude,
          lng: venue.longitude,
          infoWindow: render_to_string(partial: "infowindowvenue", locals: { venue: venue })
        }
        end
    end
  end

  def terms
  end

  def privacy
  end

    def dashboard
    # @users_dubai = User.identity.where(status: 'pending').sort_by { |event| [event.created_at] }
    invited = User.where(:id => :invited_id.to_s)
    #@wishes = Wish.all

    @identity = Identity.find_by(user_id: params[:id])
    @users = User.all
    @users_pending = User.where(status: 'pending').sort_by { |event| [event.created_at] }
    @users_approved = User.where(status: 'approved').sort_by { |event| [event.created_at] }.reverse
    @users_not_approved = User.where(status: 'not approved').sort_by { |event| [event.created_at] }
     unless params[:search].blank?
      data_base = User.where.not(id: current_user.id)
      @parameter = params[:search].downcase
      @results = data_base.where("last_name ILIKE :search OR first_name ILIKE :search OR company ILIKE :search OR activity ILIKE :search OR member ILIKE :search OR email ILIKE :search", search: "%#{@parameter}%")
      end
    unless current_user.email == 'joa.azria@gmail.com'
      redirect_to root_path, notice: 'Unauthorized Area'
    end
  end
  def millennium
      @users = User.all
  end


    def profile
    @bands = Band.includes(:offers).where(offers: { user_id: current_user.id })

      @festivals = Festival.all
      @favorite_festivals = current_user.favorited_by_type('Festival')
  end


  def ongoing_festivals
    @results = Festival.where("festival_name ILIKE :query OR genero1 ILIKE :query OR genero2 ILIKE :query OR genero3 ILIKE :query", query: "%#{params[:query]}%")
    @festivals = Festival.all 
  end


  def new_visual
    @agency = Agency.where(user_id: current_user)
    @bands = Band.where(agency_id: @agency)
    @festivals = Festival.all
    @venues = Venue.all
     
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
          # @all_venues = []
          # @venues.each do |venue|
          #   @all_venues  << venue.venue_name
          # end
        end
        
  
  
  
  end
  

end
