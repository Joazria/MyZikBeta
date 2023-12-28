class AgenciesController < ApplicationController
  before_action :set_agency, only: [:band_offers, :show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

def index


    if params[:query].blank?
      @agencies = Agency.all
 
    else
      @results = Agency.where("agency_name ILIKE :query", query: "%#{params[:query]}%")
    end
end

def show
  @agencies = Agency.all
  @bands = Band.where(agency_id: @agency.id)
end

def new
  @agency = Agency.new
end

def edit
  unless current_user.email == 'joa.azria@gmail.com' || current_user.id == @agency.user_id
    redirect_to root_path, notice: 'Unauthorized Area'
  end
end

def create
  @agency = Agency.new(agency_params)
  @agency.user = current_user
  if @agency.save
    redirect_to @agency, notice: "Your Agency was successfully created."
  else
    render :new
  end
end

def update
  if @agency.update(agency_params)
    redirect_to @agency, notice: "Your Agency was successfully updated."
  else
    render :edit
  end
end

def destroy
  @agency.destroy
  redirect_to root_path, notice: "Your agency was successfully destroyed."
end

private

# Use callbacks to share common setup or constraints between actions.
def set_agency
  @agency = Agency.find(params[:id])
end

# Only allow a trusted parameter "white list" through.
def agency_params
params.require(:agency).permit(:agency_name, 
  :agency_link,
  :agency_fb,
  :agency_insta,
  :agency_release, 
  :agency_email,
  :agency_tel,
  :agency_country,
  :agency_state,
  :logo,
  :banner )
end
end
