class FestivalsController < ApplicationController

   before_action :set_festival, only: [:show, :edit, :update, :destroy, :test]
   before_action :set_favorite_festival, only: [:index, :show]
   before_action :authenticate_user!, only: [:toggle_favorite, :show, :edit, :index]


  def index

    if params[:query].blank?
        @festivals = Festival.all
       

         @markers = @festivals.geocoded.map do |festival|
          {
            lat: festival.latitude,
            lng: festival.longitude,
            infoWindow: render_to_string(partial: "infowindow", locals: { festival: festival })
          }
          end
      else
        @results = Festival.where("festival_name ILIKE :query OR genero1 ILIKE :query OR genero2 ILIKE :query OR genero3 ILIKE :query", query: "%#{params[:query]}%")

         @markers = @results.geocoded.map do |festival|
          {
            lat: festival.latitude,
            lng: festival.longitude,
            infoWindow: render_to_string(partial: "infowindow", locals: { festival: festival })
          }
          end

      # @favorite_festivals = current_user.favorited_by_type('Festival')

      end
  end

def show
     @festivals = Festival.all
end

def test
  @festivals = Festival.where(id: params[:id]).where.not(latitude: nil, longitude: nil)
   @markers = @festivals.geocoded.map do |festival|
   {
     lat: festival.latitude,
     lng: festival.longitude,
     infoWindow: render_to_string(partial: "infowindow", locals: { festival: festival })
   }
 end
end

  def new
    @festival = Festival.new
  end

  def edit
    # unless current_user.email == 'joa.azria@gmail.com' || current_user.id == @band.user_id
    #   redirect_to root_path, notice: 'Unauthorized Area'
    # end
  end

  def create
    @festival = Festival.new(festival_params)
    @festival.user = current_user
    if @festival.save
      redirect_to @festival, notice: "Your festival was successfully created."
    else
      render :new, notice: "Ta ruim né."
    end
  end


  def update
    if @festival.update(festival_params)
      redirect_to @festival, notice: "Your festival was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @festival.destroy
    redirect_to root_path, notice: "Your festival was successfully destroyed."
  end

  def toggle_favorite
    @festival = Festival.find_by(id: params[:id])
    current_user.favorited?(@festival) ?
    current_user.unfavorite(@festival) :
    current_user.favorite(@festival)
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_festival
    @festival = Festival.find(params[:id])
  end

    def set_favorite_festival
    # @favorite_festivals = current_user.favorited_by_type('Festival')
  end

  # Only allow a trusted parameter "white list" through.
  def festival_params
  params.require(:festival).permit(:release,
                                  :name,
                                  :comment, 
                                  :site,
                                  :fb,
                                  :insta,
                                  :periode_start,
                                  :periode_end,
                                  :line_up,
                                  :email,
                                  :tel,
                                  :festival_name,
                                  :photo,
                                  :address,
                                  :longitude,
                                  :latitude,
                                  :genero1,
                                  :genero2,
                                  :genero3,
                                  :genero4,
                                  :genero5,
                                  :genero6,
                                  :youtube,
                                  :ticket,
                                  :capacity,
                                  :name2,
                                  :email2,
                                  :tel2,
                                  :confirmation)
  end
end
