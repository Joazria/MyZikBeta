class NoticeController < ApplicationController
      before_action :set_notice, only: [ :show, :edit, :update, :destroy]

  def index
      @notices = Notice.all
  end

  def show
    @notices = Notice.all
  end

  def new
    @notice = Notice.new
  end

  def edit
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.user = current_user
    if @notice.save
      redirect_to root_path, notice: "Your Edital / News was successfully created."
    else
      render :new
    end
  end

  def update
    if @notice.update(notice_params)
      redirect_to root_path, notice: "Your Edital/news was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @notice.destroy
    redirect_to root_path, notice: "Your Edital/notice was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notice
    @notice = Notice.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def notice_params
  params.require(:notice).permit(:region, :state, :award, :proponente, :deadline, :description, :link)
  end
end
