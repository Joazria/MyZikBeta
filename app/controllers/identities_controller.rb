class IdentitiesController < ApplicationController
    before_action :set_identity, only: [ :show, :edit, :update, :destroy]

  def index
      @identities = Identity.all
  end

  def show
    @identities = Identity.all
  end

  def new
    @identity = Identity.new
  end

  def edit
    unless current_user.email == 'joa.azria@gmail.com' || current_user.id == @identity.user_id
      redirect_to root_path, notice: 'Unauthorized Area'
    end
  end

  def create
    @identity = Identity.new(identity_params)
    @identity.user = current_user
    if @identity.save
      redirect_to welcome_path, notice: "Seu perfil foi criado com successo."
    else
      render :new, notice: "not fucking working."
    end
  end

  def update
      @user = Identity.find(params[:id]).user
    if @identity.update(identity_params)
      redirect_to root_path, notice: "Seu perfil foi atualizado com successo."
    else
      render :edit
    end
  end

  def destroy
    @identity.destroy
    redirect_to root_path, notice: "Seu perfil foi destruido com successo."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_identity
    @identity = Identity.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def identity_params
  params.require(:identity).permit(:username, :country, :state, :city, :language, :release, :member, :whatsapp)
  end
end
