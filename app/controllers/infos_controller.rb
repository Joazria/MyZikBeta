class InfosController < ApplicationController
     before_action :set_info, only: [ :show, :edit, :update, :destroy]
      skip_before_action :authenticate_user!, only: [ :index ]

  def index
      @infos = Info.all
  end

  def show
    @infos = Info.all
  end

  def new
    @info = Info.new
  end

  def edit
  end

  def create
    @info = Info.new(info_params)
    @info.user = current_user
    if @info.save
      redirect_to root_path, info: "Your Edital / News was successfully created."
    else
      render :new
    end
  end

  def update
    if @info.update(info_params)
      redirect_to root_path, info: "Your Edital/news was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @info.destroy
    redirect_to root_path, info: "Your Edital/notice was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_info
    @info = Info.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def info_params
  params.require(:info).permit(:region, :state, :award, :proponente, :deadline, :description, :link, :name, :photo)
  end
end
